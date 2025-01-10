class User < ApplicationRecord
  # Include Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { password.present? }

  # Default values for attributes
  after_initialize :set_defaults

  # Association
  has_many :tasks, dependent: :destroy

  # Method to initialize default values
  def set_defaults
    self.level ||= 1
    self.current_xp ||= 0
    self.xp_to_next_level ||= 100
  end

  # Custom methods for XP, leveling, and streak management
  def gain_xp(amount)
    self.current_xp += amount
    self.habits_completed += 1
    check_level_up
    save!
  end

  def check_level_up
    while current_xp >= xp_to_next_level
      level_up
    end
  end

  def level_up
    self.level += 1
    self.current_xp -= xp_to_next_level
    self.max_hp += 10
    self.xp_to_next_level = calculate_xp_to_next_level
    save!
  end

  def calculate_xp_to_next_level
    100 + (level - 1) * 50
  end
end

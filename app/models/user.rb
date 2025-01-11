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
    if self.current_xp >= self.xp_to_next_level
      self.level_up
    end
    save!
  end

  def level_up
    self.level += 1
    self.current_xp = 0
    self.xp_to_next_level *= 1.5
  end
end

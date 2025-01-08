class HabitList < ApplicationRecord
    belongs_to :list_owner, class_name: "User"
    has_many :habit_list_items, dependent: :destroy

    before_create :initialize_completed_habits

    # Validations
    validates :name, presence: true, length: { maximum: 200 }
    validates :list_owner_id, presence: true

    private

    def initialize_completed_habits
        self.completed_habits ||= 0
    end
end

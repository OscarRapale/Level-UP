class HabitListItem < ApplicationRecord
  belongs_to :habit_list
  belongs_to :habit

  validates :habit_list_id, presence: true
end

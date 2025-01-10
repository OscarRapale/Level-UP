class DropHabitLists < ActiveRecord::Migration[7.0]
  def change
    drop_table :habit_list_items, if_exists: true
    drop_table :habit_lists, if_exists: true
  end
end

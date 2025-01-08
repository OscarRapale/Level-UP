class CreateHabitListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_list_items do |t|
      t.references :habit_list, null: false, foreign_key: true
      t.bigint :habit_id
      t.boolean :habit_is_completed, default: false
      t.boolean :is_late, default: false
      t.timestamps
    end
  end
end

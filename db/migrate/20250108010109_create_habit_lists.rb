class CreateHabitLists < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_lists do |t|
      t.string :name                # Name of the habit list
      t.references :list_owner,     # Foreign key reference to the User model
                    null: false,    # Prevent null values
                    foreign_key: { to_table: :users },
                    type: :bigint     
      t.integer :completed_habits, default: 0  # Default to 0
      t.timestamps                  # Automatically adds created_at and updated_at
    end
  end
end

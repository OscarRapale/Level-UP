class RemoveCustomFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :habits_completed, :integer
    remove_column :users, :max_hp, :integer
    remove_column :users, :hp, :integer
    remove_column :users, :streak, :integer
    remove_column :users, :total_login_count, :integer
    remove_column :users, :last_login, :datetime
    remove_column :users, :is_admin, :boolean
  end
end

class AddCustomFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :level, :integer, default: 1
    add_column :users, :current_xp, :integer, default: 0
    add_column :users, :xp_to_next_level, :integer, default: 100
    add_column :users, :habits_completed, :integer, default: 0
    add_column :users, :max_hp, :integer, default: 50
    add_column :users, :hp, :integer, default: 50
    add_column :users, :streak, :integer, default: 0
    add_column :users, :total_login_count, :integer, default: 0
    add_column :users, :last_login, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :users, :is_admin, :boolean, default: false
  end
end

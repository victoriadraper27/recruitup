class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string, default: 'head_coach'
    add_reference :users, :organization, null: false, foreign_key: true
    add_reference :users, :sport, null: false, foreign_key: true
  end
end

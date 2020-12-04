class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string, default: 'Head Coach'
    add_reference :users, :team, null: false, foreign_key: true
  end
end

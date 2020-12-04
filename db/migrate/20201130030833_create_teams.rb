class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.integer :selected_schedule_id

      t.timestamps
    end
  end
end

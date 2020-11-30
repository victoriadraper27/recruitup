class CreateAthleteEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :athlete_events do |t|
      t.references :athlete, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateScheduleEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_events do |t|
      t.references :event, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end

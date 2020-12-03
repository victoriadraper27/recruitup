class AddUserToScheduleEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedule_events, :user, null: false, foreign_key: true
  end
end

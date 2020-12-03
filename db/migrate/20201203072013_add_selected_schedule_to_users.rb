class AddSelectedScheduleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :selected_schedule_id, :integer
  end
end

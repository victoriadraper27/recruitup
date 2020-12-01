class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_date, :datetime
    add_column :events, :start_time, :datetime
  end
end

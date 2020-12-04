class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :start_time
      t.string :address

      t.timestamps
    end
  end
end

class CreateAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :appearances do |t|
      t.references :event, null: false, foreign_key: true
      t.references :recruit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

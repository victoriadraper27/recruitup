class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grad_year
      t.string :team
      t.string :team_url
      t.integer :rank
      t.string :nationality

      t.timestamps
    end
  end
end

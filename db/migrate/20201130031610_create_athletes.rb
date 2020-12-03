class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grad_year
      t.string :athlete_team
      t.string :athlete_team_url
      t.integer :rating
      t.string :nationality

      t.timestamps
    end
  end
end

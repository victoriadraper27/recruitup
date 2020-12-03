class AddTeamToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_reference :recruits, :team, null: false, foreign_key: true
  end
end

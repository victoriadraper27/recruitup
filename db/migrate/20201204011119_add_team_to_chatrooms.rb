class AddTeamToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :team, null: false, foreign_key: true
  end
end

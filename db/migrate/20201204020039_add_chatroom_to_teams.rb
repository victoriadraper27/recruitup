class AddChatroomToTeams < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :chatroom, null: false, foreign_key: true
  end
end

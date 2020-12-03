class AddOrganizationIdAndSportIdToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :organization, null: false, foreign_key: true
    add_reference :chatrooms, :sport, null: false, foreign_key: true
  end
end

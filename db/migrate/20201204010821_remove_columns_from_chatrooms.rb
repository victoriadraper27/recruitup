class RemoveColumnsFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :organization, null: false, foreign_key: true
    remove_reference :chatrooms, :sport, null: false, foreign_key: true
  end
end

class RemoveUserFromRecruits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :recruits, :user, null: false, foreign_key: true
  end
end

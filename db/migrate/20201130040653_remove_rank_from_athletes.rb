class RemoveRankFromAthletes < ActiveRecord::Migration[6.0]
  def change
    remove_column :athletes, :rank, :integer
  end
end

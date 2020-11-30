class AddRatingToAthletes < ActiveRecord::Migration[6.0]
  def change
    add_column :athletes, :rating, :integer
  end
end

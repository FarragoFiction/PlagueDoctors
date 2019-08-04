class AddRatingToTombstoneTimeHolds < ActiveRecord::Migration[5.0]
  def change
    add_column :tombstone_timeholds, :rating, :integer
  end
end

class CreateTombstoneTimeholds < ActiveRecord::Migration[5.0]
  def change
    create_table :tombstone_timeholds do |t|
      t.string :tombstoneJSON
      t.boolean :permanent

      t.timestamps
    end
  end
end

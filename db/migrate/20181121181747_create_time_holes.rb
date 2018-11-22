class CreateTimeHoles < ActiveRecord::Migration[5.0]
  def change
    create_table :time_holes do |t|
      t.string :wigglerJSON
      t.boolean :permanent

      t.timestamps
    end
  end
end

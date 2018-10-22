class CreatePaldemicFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :paldemic_files do |t|
      t.string :name
      t.string :author
      t.string :file
      t.integer :num_downloads
      t.integer :num_upvotes
      t.integer :num_downvotes

      t.timestamps
    end
  end
end
class AddNumViewsToPaldemicFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :paldemic_files, :integer, :num_views, :null => false, :default => 0
  end
end

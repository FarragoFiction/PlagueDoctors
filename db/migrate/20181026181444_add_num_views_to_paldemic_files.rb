class AddNumViewsToPaldemicFiles2 < ActiveRecord::Migration[5.0]
  def change
    add_column :paldemic_files,:num_views,:integer, :null => false, :default => 0
  end
end

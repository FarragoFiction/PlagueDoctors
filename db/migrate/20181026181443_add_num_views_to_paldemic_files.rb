class AddNumViewsToPaldemicFiles < ActiveRecord::Migration[5.0]
  def change
    #why did it even let me accidentally do it backwards? bluuuuuuuh
    add_column :paldemic_files,:num_views,:integer, :null => false, :default => 0
  end
end

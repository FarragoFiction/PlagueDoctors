class AddDescriptionToPaldemicFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :paldemic_files, :description, :string, :null => false, :default => "A really cool paldemic file, I promise!!!"
  end
end

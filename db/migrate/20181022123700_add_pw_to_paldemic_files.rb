class AddPwToPaldemicFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :paldemic_files, :pw, :string
  end
end

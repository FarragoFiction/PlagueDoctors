class AddBanflagTocaretaker < ActiveRecord::Migration[5.0]
  def change
    add_column :caretakers, :banflag, :boolean
  end
end

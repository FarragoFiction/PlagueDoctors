class AddCorruptionSourceToCaretaker < ActiveRecord::Migration[5.0]
  def change
    add_column :caretakers, :corruption_source, :boolean
  end
end

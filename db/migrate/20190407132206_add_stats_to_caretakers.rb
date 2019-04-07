class AddStatsToCaretakers < ActiveRecord::Migration[5.0]
  def change
    add_column :caretakers, :grubs_donated, :integer
    add_column :caretakers, :grubs_adopted, :integer

  end
end

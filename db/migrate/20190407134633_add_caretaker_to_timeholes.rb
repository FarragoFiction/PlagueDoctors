class AddCaretakerToTimeholes < ActiveRecord::Migration[5.0]
  def change
    add_column :time_holes, :caretaker_id, :integer

  end
end

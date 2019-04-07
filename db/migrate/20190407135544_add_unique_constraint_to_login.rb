class AddUniqueConstraintToLogin < ActiveRecord::Migration[5.0]
  def change
    add_index :caretakers, :login, unique: true
  end
end

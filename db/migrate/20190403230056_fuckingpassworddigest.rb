class Fuckingpassworddigest < ActiveRecord::Migration[5.0]
  def change
    add_column :caretakers, :password_digest, :string
  end
end

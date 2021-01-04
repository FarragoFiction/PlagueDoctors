class CreateBanneds < ActiveRecord::Migration[5.0]
  def change
    create_table :banneds do |t|
      t.string :ip
      t.string :reason
      t.integer :caretaker_id
      t.timestamps
    end
  end
end

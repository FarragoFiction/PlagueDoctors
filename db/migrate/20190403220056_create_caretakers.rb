class CreateCaretakers < ActiveRecord::Migration[5.0]
  #WARNING THIS IS A BULLSHIT HACK TO GET AROUND THE FACT THAT I ACCIDENTALLY DELETED THE MIGRATION
  def change
    create_table :caretakers do |t|
      t.string   "name"
      t.string   "doll"
      t.string   "desc"
      t.integer  "good_boi_points"
      t.integer  "bad_boi_points"
      t.string   "login"
      t.string   "password"
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.string   "password_digest"
      t.timestamps
    end
  end
end

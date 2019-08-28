class CreateGiveMeAdminPussies < ActiveRecord::Migration[5.0]
  def change
    create_table :give_me_admin_pussies do |t|
      t.string :demand

      t.timestamps
    end
  end
end

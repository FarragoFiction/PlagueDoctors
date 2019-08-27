class CreateAllSeeingEyes < ActiveRecord::Migration[5.0]
  def change
    create_table :all_seeing_eyes do |t|
      t.string :ip
      t.string :message

      t.timestamps
    end
  end
end

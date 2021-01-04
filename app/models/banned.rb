class Banned < ApplicationRecord
  belongs_to :caretaker
  #      t.string :ip
  # t.string :reason
  # t.integer :caretaker_id
end

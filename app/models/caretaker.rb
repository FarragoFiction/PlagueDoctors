class Caretaker < ApplicationRecord
  has_secure_password
  validates :name,:doll, :desc, :login, presence: true
  before_save :not_null

  #could have also changed the db but whatever
  def not_null
    bad_boi_points ||=0
    good_boi_points ||=0
  end

end

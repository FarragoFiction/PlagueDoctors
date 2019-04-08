class Caretaker < ApplicationRecord
  has_secure_password
  validates :name,:doll, :desc, :login, presence: true
  #TODO make sure login is unique
  before_save :not_null
  has_many :time_holes

  def grubs_adopted
    super || 0
  end

  def grubs_donated
    super || 0
  end
  def Caretaker.default_caretaker
    #looks for a caretaker with zawhei's login, if they can't find it they just...make one
    ret = Caretaker.find_by_login("yggdrasilsYeoman")
    if ret == nil
      #in theory, YY being hacked would be 100% canon. but don't like, do anything dumb yeah? 
      ret = Caretaker.create!(name: "Zawhei Bacama", doll: "Zawhei+Bacama%3A___AshgHhEYHhEYFYiT________q6uoAAAAAAAAA_wAAAAAFYiQHhEYFYiQFYiQDNhT___8gFUYA_wAA_wBJSUmAgIBjHbQxDloIgJoBNAEEgIz8CUAvAF4ASEAkOA%3D", desc: "Zawhei+Bacama%3A___AshgHhEYHhEYFYiT________q6uoAAAAAAAAA_wAAAAAFYiQHhEYFYiQFYiQDNhT___8gFUYA_wAA_wBJSUmAgIBjHbQxDloIgJoBNAEEgIz8CUAvAF4ASEAkOA%3D", login: "yggdrasilsYeoman", good_boi_points: 85, bad_boi_points:85, password: "nidhoggsFavorite")
    end
    return ret
  end

  #could have also changed the db but whatever
  def not_null
    bad_boi_points ||=0
    good_boi_points ||=0
  end

end

class Caretaker < ApplicationRecord
  has_secure_password
  validates :name,:doll, :desc, :login, presence: true
  #TODO make sure login is unique
  before_save :not_null
  has_many :time_holes

  def grubs_adopted
    read_attribute(:grubs_adopted) || 0
  end

  def grubs_donated
    read_attribute(:grubs_donated) || 0
  end

  def grubs_adopted_lazy
    read_attribute(:grubs_adopted) || 0
  end

  def grubs_donated_lazy
    read_attribute(:grubs_donated) || 0
  end

  def total_points
    good_boi_points - bad_boi_points
  end

  def Caretaker.default_caretaker
    #looks for a caretaker with zawhei's login, if they can't find it they just...make one
    ret = Caretaker.find_by_login("yggdrasilsYeoman")
    if ret == nil
      #in theory, YY being hacked would be 100% canon. but don't like, do anything dumb yeah? 
      ret = Caretaker.create!(name: "Zawhei Bacama", doll: "Zawhei+Bacama%3A___AshgHhEYHhEYFYiT________q6uoAAAAAAAAA_wAAAAAFYiQHhEYFYiQFYiQDNhT___8gFUYA_wAA_wBJSUmAgIBjHbQxDloIgJoBNAEEgIz8CUAvAF4ASEAkOA%3D", desc: "Zawhei+Bacama%3A___AshgHhEYHhEYFYiT________q6uoAAAAAAAAA_wAAAAAFYiQHhEYFYiQFYiQDNhT___8gFUYA_wAA_wBJSUmAgIBjHbQxDloIgJoBNAEEgIz8CUAvAF4ASEAkOA%3D", login: "yggdrasilsYeoman", good_boi_points: 85, bad_boi_points:85, password: "nidhoggsFavorite")
      ret = Caretaker.create!(name: "Karkat Vantas", doll: "Karkat Vantas:___YUbGxsbGxsiIiIbGxsmZmZSkpK_7op_7opAAAAAAAAS0tLOjo6ERERSkpKERERSkpKxMTE_wAAfwAACIKwVjS_wLYeDwWC2A", desc: "WHAT EVEN ARE THESE RANDOM WIGGLERS?", login: "carcinoGeneticist", good_boi_points: 12, bad_boi_points:6, password: "noonegetsinorthebunnygetsit")

    end
    return ret
  end

  #could have also changed the db but whatever
  def not_null
    bad_boi_points ||=0
    good_boi_points ||=0
  end

  #i am doing so many metaprogramming shenanigans here, it shoudl probably be illegal
  # but it acomplishes my goal of getting this done quick
  def Caretaker.sortShenanigans(files,sortby, reverse, limit)
    #secretly the default is to have max first cuz thats what you'd expect
    if reverse
      if(Caretaker.has_attribute? sortby)
        files = files.sort_by{|file| file[sortby]}
      else
        files =files.sort_by{|file| file.send sortby}
      end
    else
      if(Caretaker.has_attribute? sortby)
        files =files.sort_by{|file| file[sortby]}.reverse
      else
        files =files.sort_by{|file| file.send sortby}.reverse
      end
    end
    return files.first(limit)
  end


end

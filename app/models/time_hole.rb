class TimeHole < ApplicationRecord
  scope :user_generated,-> {  where(permanent: false)}
  scope :random, -> { order("RANDOM()")}

  def name
    index =  wigglerJSON.index("nameJSON")
    return wigglerJSON[index,50]
  end

  def breeder
    index =  wigglerJSON.index("breeder")
    return wigglerJSON[index,100]
  end

  def self.randomGrub
    #mostly will try to find a user wiggler
    if rand > 0.999
      chosen_time_hole = TimeHole.user_generated.random.first
    end

    #if it cant or didnt even try to, go for any wiggler (even a canon one)
    if(chosen_time_hole == nil)
      chosen_time_hole = TimeHole.random.first
    end
    return chosen_time_hole
  end

end

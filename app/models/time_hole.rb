class TimeHole < ApplicationRecord
  scope :user_generated,-> {  where(permanent: false)}
  scope :random, -> { order("RANDOM()")}

  def name
    index =  wigglerJSON.index("nameJSON")
    index2 = wigglerJSON.index("healthJson")
    return wigglerJSON[index,100]
  end

end

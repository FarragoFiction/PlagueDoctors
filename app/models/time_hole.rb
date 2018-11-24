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

end

class TimeHole < ApplicationRecord
  scope :user_generated,-> {  where(permanent: false)}
  scope :random, -> { order("RANDOM()")}
  belongs_to :caretaker
  validates :wigglerJSON, uniqueness: true
  def caretaker
    super || Caretaker.default_caretaker
  end

  def caretaker_id
    super || Caretaker.default_caretaker.id
  end


  def parsedPetJSON
    begin
      return JSON.parse(JSON.parse(wigglerJSON)["pet"])
    rescue JSON::ParserError
      return {}
    end
  end

  def parsedJSON
    begin
      return JSON.parse(wigglerJSON)
    rescue JSON::ParserError
      return {}
    end

  end

  #["lastPlayed", "isempress", "hatchDate", "lastFed", "dollDATAURL", "boredomJson", "nameJSON", "healthJson", "TYPE", "corrupt", "purified", "patience", "idealistic", "curious", "loyal", "energetic", "external", "remembered", "rememberedNames", "rememberedCastes"]


  def TimeHole.json_keys
    ["TYPE", "isempress","corrupt", "purified", "lastPlayed", "hatchDate", "lastFed", "patience", "idealistic", "curious", "loyal", "energetic", "external", "remembered", "rememberedNames", "rememberedCastes"]
  end

  def name
    return parsedPetJSON["nameJSON"]
  end





  def breeder
    parsedJSON["breeder"]
  end

  def self.randomGrub
    #mostly will try to find a user wiggler
    random_number = rand()
    if random_number < 0.9
      chosen_time_hole = TimeHole.user_generated.random.first
    end

    #if it cant or didnt even try to, go for any wiggler (even a canon one)
    if(chosen_time_hole == nil)
      chosen_time_hole = TimeHole.random.first
    end
    return chosen_time_hole
  end

end

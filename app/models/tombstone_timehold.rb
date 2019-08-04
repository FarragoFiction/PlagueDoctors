class TombstoneTimehold < ApplicationRecord

  #todo dont let things be TOO long or have words off the white list

  #todo make it so that tombstones can't be uploaded if they don't have the approved fridge words (will have to parse fridge words)
  def TombstoneTimehold.white_list
    %w(foo bar)
  end

  def rating
    read_attribute(:rating) || 0
  end

end

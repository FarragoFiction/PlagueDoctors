class TombstoneTimehold < ApplicationRecord

  #todo make it so that tombstones can't be uploaded if they don't have the approved fridge words
  def TombstoneTimehold.white_list
    %w(foo bar)
  end

end

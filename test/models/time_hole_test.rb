require 'test_helper'

class TimeHoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #

  test "canonWigglersAreRare" do
    canonCount = 0;
    Rails.application.load_seed
    1000.times do |x|
      name = TimeHole.randomGrub.breeder
      #puts "found wiggler bred by #{name}"
      if name.include? "carcino"
        canonCount += 1
      end
    end
    puts "#{canonCount} canon wiggler found"
    assert canonCount < 10
  end
end

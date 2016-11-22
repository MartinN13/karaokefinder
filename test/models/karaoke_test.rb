require 'test_helper'

class KaraokeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @karaoke = Karaoke.new(name: "Karaokekan", drink_price: 380, day: "11:00-19:00", 
                           day_price: 80, day_price_weekend: 133, day_price_freetime: 1306, 
                           day_price_freetime_weekend: 1680, night: "19:00-06:00", night_price: 414,
                           night_price_weekend: 546, night_price_freetime: 1320,
                           night_price_freetime_weekend: 2653, conditions: "one-drink")
  end

  test "should be valid" do
    assert @karaoke.valid?
  end

  test "every field should be present except for conditions" do
    @karaoke.name = " "
    @karaoke.drink_price = " "
    @karaoke.day = " "
    @karaoke.day_price = " "
    @karaoke.day_price_weekend = " "
    @karaoke.day_price_freetime = " "
    @karaoke.day_price_freetime_weekend = " "
    @karaoke.night = " "
    @karaoke.night_price = " "
    @karaoke.night_price_weekend = " "
    @karaoke.night_price_freetime = " "
    @karaoke.night_price_freetime_weekend = " "
    assert_not @karaoke.valid?
  end

  test "name should be unique" do
    duplicate_karaoke = @karaoke.dup
    @karaoke.save
    assert_not duplicate_karaoke.valid?
  end
end

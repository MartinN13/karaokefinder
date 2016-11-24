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

  test "karaoke should be valid" do
    assert @karaoke.valid?
  end

  test "name should be unique" do
    duplicate_karaoke = @karaoke.dup
    @karaoke.save
    assert_not duplicate_karaoke.valid?
  end

  test "prices should only be whole numbers" do
    @karaoke.drink_price = "66.6"
    @karaoke.day_price = "66.6"
    @karaoke.day_price_weekend = "66.6"
    @karaoke.day_price_freetime = "66.6"
    @karaoke.day_price_freetime_weekend = "66.6"
    @karaoke.night_price = "66.6"
    @karaoke.night_price_weekend = "66.6"
    @karaoke.night_price_freetime = "66.6"
    @karaoke.night_price_freetime_weekend = "66.6"
    assert_not @karaoke.valid?
  end

  test "prices should be between 0 and 10000" do
    @karaoke.drink_price = "10001"
    @karaoke.day_price = "10001"
    @karaoke.day_price_weekend = "10001"
    @karaoke.day_price_freetime = "10001"
    @karaoke.day_price_freetime_weekend = "10001"
    @karaoke.night_price = "-1"
    @karaoke.night_price_weekend = "-1"
    @karaoke.night_price_freetime = "-1"
    @karaoke.night_price_freetime_weekend = "-1"
    assert_not @karaoke.valid?
  end

  test "day and night should only be in a hh:mm-hh:mm range" do
    @karaoke.day = "not a time"
    @karaoke.night = "20:48"
    assert_not @karaoke.valid?
  end

  test "day and night should only have valid time ranges" do
    @karaoke.day = "24:01-06:00"
    @karaoke.night = "08:61-09:18"
    assert_not @karaoke.valid?
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
end

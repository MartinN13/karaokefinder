class Karaoke < ApplicationRecord
  # Name has to be unique
  validates :name, uniqueness: true

  # Price validations
  NUMBER_MESSAGE = "can only be a whole number"
  PRICE_MESSAGE = "can only be a number between 0 and 10000"
  validates_numericality_of :drink_price, :day_price, :day_price_weekend, :day_price_freetime,
                            :day_price_freetime_weekend, :night_price, :night_price_weekend, 
                            :night_price_freetime, :night_price_freetime_weekend,
                            :only_integer => true, :message => NUMBER_MESSAGE, allow_blank: true
  validates_inclusion_of  :drink_price, :day_price, :day_price_weekend, :day_price_freetime,
                         :day_price_freetime_weekend, :night_price, :night_price_weekend, 
                         :night_price_freetime, :night_price_freetime_weekend, :in => 0..10000,
                         :message => PRICE_MESSAGE, allow_blank: true

  # Time validations
  TIME_REGEX = /(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]-(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]/
  validates :day, :night, format: { with: TIME_REGEX }, allow_blank: true

  # Every field except conditions needs to be present
  validates :name, :day, :night, :drink_price, :day_price, :day_price_weekend, :day_price_freetime,
            :day_price_freetime_weekend,:night_price, :night_price_weekend, :night_price_freetime,
            :night_price_freetime_weekend, presence: true
end

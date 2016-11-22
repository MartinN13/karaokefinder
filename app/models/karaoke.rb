class Karaoke < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :drink_price, presence: true
  validates :day, presence: true
  validates :day_price, presence: true
  validates :day_price_weekend, presence: true
  validates :day_price_freetime, presence: true
  validates :day_price_freetime_weekend, presence: true
  validates :night, presence: true
  validates :night_price, presence: true
  validates :night_price_weekend, presence: true
  validates :night_price_freetime, presence: true
  validates :night_price_freetime_weekend, presence: true
end

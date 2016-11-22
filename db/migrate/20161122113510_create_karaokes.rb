class CreateKaraokes < ActiveRecord::Migration[5.0]
  def change
    create_table :karaokes do |t|
      t.string :name
      t.integer :drink_price
      t.time :day
      t.integer :day_price
      t.integer :day_price_weekend
      t.integer :day_price_freetime
      t.integer :day_price_freetime_weekend
      t.time :night
      t.integer :night_price
      t.integer :night_price_weekend
      t.integer :night_price_freetime
      t.integer :night_price_freetime_weekend
      t.string :conditions

      t.timestamps
    end
  end
end

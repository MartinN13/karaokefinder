class Change < ActiveRecord::Migration[5.0]
  def change
    # Change the column types from date to string for easier validation tests
    change_column :karaokes, :day, :string
    change_column :karaokes, :night, :string
  end
end

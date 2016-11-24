class Change < ActiveRecord::Migration[5.0]
  def change
    change_column :karaokes, :day, :string
    change_column :karaokes, :night, :string
  end
end

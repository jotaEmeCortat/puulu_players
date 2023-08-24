class AddLatLongToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :latitude, :float
    add_column :players, :longitude, :float
  end
end

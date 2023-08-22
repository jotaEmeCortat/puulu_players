class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :player_email
      t.string :player_nationality
      t.string :player_gender
      t.string :player_description
      t.date :player_date_of_birth
      t.string :player_position
      t.string :player_role
      t.string :player_handedness
      t.string :player_social
      t.string :player_avatar_image
      t.string :player_banner_image
      t.boolean :player_availability
      t.date :player_availability_period
      t.integer :player_rating
      t.integer :player_price

      t.timestamps
    end
  end
end

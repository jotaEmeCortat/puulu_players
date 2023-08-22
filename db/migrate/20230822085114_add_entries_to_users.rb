class AddEntriesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :team_name, :string
    add_column :users, :team_country, :string
    add_column :users, :team_description, :text
    add_column :users, :team_badge_image, :string
    add_column :users, :team_banner_image, :string
    add_column :users, :team_rating, :integer
  end
end

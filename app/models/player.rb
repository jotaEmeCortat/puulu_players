class Player < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :avatar
  has_one_attached :banner

  # geocoded_by :player_nationality
  # after_validation :geocode, if: :will_save_change_to_location?

end

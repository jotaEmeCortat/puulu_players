class Player < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :avatar
  has_one_attached :banner

end

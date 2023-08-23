class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :players, through: :bookings
  has_many :bookings

  has_one_attached :photo
  has_one_attached :banner

  COUNTRY = %W[Brazil France]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
  has_one_attached :banner

  COUNTRY = %W[Algeria Brazil France]
end

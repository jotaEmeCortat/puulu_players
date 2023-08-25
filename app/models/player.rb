class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookings, dependent: :destroy

  has_one_attached :avatar
  has_one_attached :banner

  geocoded_by :player_nationality
  after_validation :geocode, if: :will_save_change_to_player_nationality?

  include PgSearch::Model
  pg_search_scope :search_player,
    against: [ :player_name, :player_role, :player_position ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end

class DashboardsController < ApplicationController
  before_action :authenticate_user!
  # Allow the user to see the homepage without having to log in
  # skip_before_action :authenticate_user!, only: [:home]

  def profile
    @bookings = Booking.where(user_id: current_user).order(:start_date)
    @user = User.find(current_user.id)
    @bookings = current_user.bookings
    @players = current_user.players
    # authorize @bookings	# pundit
    # authorize @players	# pundit
  end
end

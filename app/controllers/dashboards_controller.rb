class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(current_user.id)
    @bookings = current_user.bookings
    @players = current_user.players
    # authorize @bookings	# pundit
    # authorize @players	# pundit
  end

  # saisir une méthode private pour les strong params ?
end

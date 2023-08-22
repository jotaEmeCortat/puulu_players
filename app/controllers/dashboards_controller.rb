class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(current_user.id)
  end

  # saisir une méthode private pour les strong params ?
end

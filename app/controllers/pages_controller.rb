class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @player = Player.new
    @players = Player.all
  end
end

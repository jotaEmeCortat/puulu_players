class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  def index
    @players = Player.all
    # @players = Player.geocoded

    @markers = @players.map do |player|
      {
        lat: player.latitude,
        lng: player.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { player: player })
      }
    end

    # if params[:query].present?
    #   @players = Player.search_player("#{params[:query]}")
    #   policy_scope(@players)
    # else
    #   @players = policy_scope(Player).order(created_at: :desc)
    # end
  end

  def show
    # authorize @player # pundit
  end

  def edit
    # authorize @player # pundit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player), status: :unprocessable_entity, notice: 'Player was successfully updated.'
    # authorize @player # pundit
  end

  def new
    @player = Player.new
    # authorize @player # pundit
  end

  def create
    @player = Player.new(player_params)
    # the user, who creates the player is the owner of that player:
    @player.user = current_user
    if @player.save!
      # Process the nationality using Geocoder
      location = Geocoder.search(@player.player_nationality).first
      if location
        @player.latitude = location.latitude
        @player.longitude = location.longitude
        @player.save!

        redirect_to player_path(@player), status: :unprocessable_entity, notice: 'Player was successfully added.'
      else
        flash.now[:alert] = 'Unable to find location for the provided nationality.'
        render :new
      end
    else
      render :new, status: :unprocessable_entity
    end
    # authorize @player # pundit
  end

  def destroy
    @player.destroy
    redirect_to players_path, status: :see_other, notice: 'Player was successfully deleted.'
    # authorize @player # pundit
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:player_name, :player_email, :player_nationality,
                                    :player_gender, :player_description, :player_date_of_birth,
                                    :player_position, :player_role, :player_handedness,
                                    :player_social, :player_avatar_image, :player_banner_image,
                                    :player_availability, :player_availability_period,
                                    :player_rating, :player_price)
  end
end

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :find_player, only: %i[new create update]

  def index
    @bookings = Booking.all
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.find(params[:player_id])
    @player_owner = @player.user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.player = Player.find(params[:player_id])
    @booking.player = @player
    @booking.status = "pending"
    @booking.user = current_user
    if @booking.save
      redirect_to player_path(@player), notice: 'Booking successful'
    else
      # render "players/show"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, status: :see_other, notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def find_player
    @player = Player.find(params[:player_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

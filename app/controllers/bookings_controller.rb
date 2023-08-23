class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    # @bookings = policy_scope(Booking)	# pundit
  end

  def show
    # authorize @booking	# pundit
  end

  def new
    @player = Player.find(params[:player_id])
    @player_owner = @player.user
    @booking = Booking.new
    # authorize @booking	# pundit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.player = Player.find(params[:player_id])
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), status: :unprocessable_entity, notice: 'Booking successful'
    else
      render :new
    end
    # authorize @booking	# pundit
  end

  def edit
    # authorize @booking	# pundit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), status: :unprocessable_entity, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
    # authorize @booking	# pundit
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: 'Booking was successfully deleted.'
    # authorize @booking	# pundit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :player_price)
  end
end

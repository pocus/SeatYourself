class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    # @seats_occupied_at_hour = seats_occupied_at_hour
  end

  def edit
  end

  def new
    # @user = User.find_by(user_id)
    @my_reso = Reservation.new
  end

  def show
  end

  def create
    @my_reso = Reservation.new(reservation_params)
    if  @my_reso.valid? && check_avail(@my_reso) == true
      @my_reso.save
       flash[:alert] = "Congrats! You created a new reservation. You are amazing!"
      redirect_to reservations_path
    else
      flash[:alert] = "There are no seats available at that time. Please select a different time."
      render :new
    end
  end

  def update
  end

  def destroy
    my_reso = Reservation.find(params[:id])
    my_reso.destroy
    redirect_to reservations_path
  end


  def check_avail(candidate_reservation)
      candidate_reservation.guest_qty < (Restaurant.find_by(id: 1).totalseats - seats_occupied_at_hour)
  end


  private
  def reservation_params
    params.require(:reservation).permit(:guest_qty, :date, :hour, :restaurant_id, :user_id)
  end

end

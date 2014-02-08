class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all 
    @seats_occupied = seats_occupied
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
    if check_avail(@my_reso) == true
      @my_reso.save
      redirect_to reservations_path
    else
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
    candidate_reservation.guest_qty < (Restaurant.find_by(id: 1).totalseats - seats_occupied)
  end

  private 
  def reservation_params
    params.require(:reservation).permit(:guest_qty, :date,:time, :restaurant_id, :user_id)
  end

end

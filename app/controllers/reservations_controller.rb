class ReservationsController < ApplicationController
  
  def index
  end

  def edit
  end

  def new
    my_reso = Reservation.new

  end

  def show
  end

  def create
    @my_reso = Reservation.new(reservation_params)
    if @my_reso.save
        redirect_to reservations_path
      else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private 
  def reservation_params

    params.require(:reservation).permit(:guest_qty, :date,:time, :restaurant_id, :user_id)

  end

end

class ReservationsController < ApplicationController

  def index
      if params[:restaurant_id] != nil  #if this exists
        @reservations = Reservation.where("restaurant_id = ?", params[:restaurant_id])
        # @seats_occupied = seats_occupied
      else #params is nothing
        @reservations = Reservation.all
      end
    end

  def edit
    @my_reso = Reservation.find(params[:id])
  end

  def update
    @my_reso = Reservation.find(params[:id])
    if @my_reso.update_attributes(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def new
    # @user = User.find_by(user_id)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @my_reso = @restaurant.reservations.new
  end

  def show
    @my_reso = Reservation.find(params[:id])
  end

  def create
    @my_reso = Reservation.new(reservation_params)
    @my_reso.restaurant_id = params[:restaurant_id]

    if  @my_reso.valid? == true
      if check_avail(@my_reso) == true
        @my_reso.save
        flash[:alert] = "Congrats! You created a new reservation. You are amazing!"
        redirect_to reservations_path
      else
        flash[:alert] = "There are no seats available at that time. Please select a different time."
        render :new
      end
    else
       flash[:alert] = "Invalid entry"
       render :new
    end
  end

  def destroy
    my_reso = Reservation.find(params[:id])
    my_reso.destroy
    redirect_to reservations_path
  end

  def check_avail(candidate_reservation)
      candidate_reservation.guest_qty <= (Restaurant.find_by(id: 1).totalseats - seats_occupied)
  end

  def seats_occupied
    @reservations = Reservation.all
     # candidate_restaurant_reservations = @reservations.where("restaurant_id='1'") #later make this restaurant_id
     # candidate_restaurant_reservations = @reservations.where("date = ?", params[:reservation][:date])
     candidate_restaurant_reservations = @reservations.where("hour = ? AND date = ? AND restaurant_id = ?", params[:reservation][:hour], params[:reservation][:date], params[:reservation][:restaurant_id])

     result = 0
     candidate_restaurant_reservations.each do |c|
     result = c.guest_qty + result
    end
    result
  end

  private
  def reservation_params
    params.require(:reservation).permit(:guest_qty, :date, :hour, :restaurant_id, :user_id)
  end

end

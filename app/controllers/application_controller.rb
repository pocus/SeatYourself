class ApplicationController < ActionController::Base
  
  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def seats_occupied_at_hour
    @reservations = Reservation.all 
     # candidate_restaurant_reservations = @reservations.where("restaurant_id='1'") #later make this restaurant_id
     candidate_restaurant_reservations = @reservations.where("hour = ? AND restaurant_id = ?", params[:hour], params[:restaurant_id])
     result = 0
     candidate_restaurant_reservations.each do |c|
      result = c.guest_qty + result
    end
    result
  end

end


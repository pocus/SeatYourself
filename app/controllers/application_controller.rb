class ApplicationController < ActionController::Base
  
  
  def seats_occupied
    @reservations = Reservation.all 
     candidate_restaurant_reservations = @reservations.where("restaurant_id='1'") #later make this restaurant_id
     seats_occupied = 0
     candidate_restaurant_reservations.each do |c|
      seats_occupied = c.guest_qty + seats_occupied
    end
    seats_occupied
  end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

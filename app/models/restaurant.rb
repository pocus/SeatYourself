class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users , through: :reservations


  def seats_occupied(reservation)
    reservations.where(hour: reservation.hour, date: reservation.date).sum(:guest_qty)
  end
end

class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, :date, :hour, :guest_qty, presence: true

end

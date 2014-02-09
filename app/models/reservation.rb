class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, :date, :hour, :guest_qty, presence: true
  validates :restaurant_id, :hour, numericality: {only_integer: true}
  validates :guest_qty, numericality: {only_integer: true, greater_than: 0}

end
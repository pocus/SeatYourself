class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :date, :hour, :guest_qty, presence: true
  validates :hour, numericality: {only_integer: true}
  validates :guest_qty, numericality: {only_integer: true, greater_than: 0}
  validate :verify_reservation_is_in_future, :validate_reservation_is_during_opening_hours
  #add validations for: hours must be in the future
  def verify_reservation_is_in_future
    unless Date.today < self.date
      self.errors[:date] << 'must be in future. No time travel allowed!'
    end
  end

  def validate_reservation_is_during_opening_hours
    unless self.hour.between?(self.restaurant.timeopening, self.restaurant.timeclosing)
      self.errors[:hour] << "must be between #{self.restaurant.timeopening} and #{self.restaurant.timeclosing}."
    end
  end
end


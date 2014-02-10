class ResoValidator < ActiveModel::Validator
  def validate(my_reso)
    unless Date.today < my_reso.date
      my_reso.errors[:date] << 'must be in future. No time travel allowed!'
    end
  end
end

class Reservation < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ResoValidator

  belongs_to :user
  belongs_to :restaurant

  validates :date, :hour, :guest_qty, presence: true
  validates :hour, numericality: {only_integer: true}
  validates :guest_qty, numericality: {only_integer: true, greater_than: 0}
  #add validations for: hours must be in the future
end


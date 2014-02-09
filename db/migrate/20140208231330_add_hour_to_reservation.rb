class AddHourToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :hour, :integer
  end
end

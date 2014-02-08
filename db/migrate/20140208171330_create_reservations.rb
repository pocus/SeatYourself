class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :guest_qty
      t.date :date
      t.time :time

      t.timestamps

      t.belongs_to :restaurant
      t.belongs_to :user 
    end
  end
end

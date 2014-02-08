class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.integer :timeopening
      t.integer :timeclosing
      t.string :menu
      t.integer :pricerange
      t.string :category
      t.integer :totalseats
      t.text :description

      t.timestamps

    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Bill Nye', phone: '555-5555', email: 'test@test.com')
Restaurant.create(name: 'Sushi Hut', address: '123 Main Street', timeopening: 12, timeclosing: 23, menu: 'www.menu.com', pricerange: 3, category: 'sushi', totalseats: 50, description: 'nom nom nom' )

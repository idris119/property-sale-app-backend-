# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)

# # vehicles
# # vehicles
# image_urls = [
#   'https://i.pinimg.com/236x/ef/ac/5e/efac5eff9db59202bb7e8941b6696470.jpg',
#   'https://i.pinimg.com/236x/15/1b/76/151b76ae33bfb9bff945a7acd1e6bd3a.jpg',
#   'https://i.pinimg.com/236x/9e/28/c9/9e28c94e8df3c2d094792f365d806135.jpg',
# ]

# vehicle_types = ['Sedan', 'SUV', 'Truck', 'Motorcycle', 'Van', 'Convertible', 'Coupe', 'Hatchback', 'Minivan']

# 15.times do
#   vehicle = Vehicle.new(
#     type: vehicle_types.sample, 
#     make: Faker::Vehicle.make,
#     model: Faker::Vehicle.model,
#     colour: Faker::Vehicle.color,
#     capacity: Faker::Number.between(from: 2, to: 10),
#     price: Faker::Commerce.price(range: 10000..50000, as_string: true),
#     image_url: image_urls.sample 
#   )
#   vehicle.save!
# end

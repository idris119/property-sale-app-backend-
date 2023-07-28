# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


puts "🏠 🚗 Seeding housing and vehicle data..."
# Clear existing data
House.destroy_all
Vehicle.destroy_all
# vehicles
image_urls = [
    'https://i.pinimg.com/236x/ef/ac/5e/efac5eff9db59202bb7e8941b6696470.jpg',
    'https://i.pinimg.com/236x/15/1b/76/151b76ae33bfb9bff945a7acd1e6bd3a.jpg',
    'https://i.pinimg.com/236x/9e/28/c9/9e28c94e8df3c2d094792f365d806135.jpg',
    'https://static.carfromjapan.com/car_f8b73a4b-4b3a-4985-8a6f-0a785fbe0930_640_0',
    'https://static.carfromjapan.com/car_4a2f57a4-ef02-4c0c-9c00-f01231e40fb5_640_0',
    'https://static.carfromjapan.com/car_860610ee-24c6-481e-b2ae-4187e6fd917a_640_0',
    'https://static.carfromjapan.com/car_4bcff6b0-5bf5-42c5-83ed-6a53611302ec_640_0',
    'https://static.carfromjapan.com/car_1dbbf459-5150-4799-b531-32ddfcc5c19e_640_0',
    'https://static.carfromjapan.com/car_18d72020-c365-4250-8a5e-a19fd891c68a_640_0',
    'https://static.carfromjapan.com/car_e3caf8b8-967a-4ebf-a27b-0851475a25a4_640_0',
    'https://static.carfromjapan.com/car_06dd24b9-71ea-4f20-9d03-24a4a815ffcd_640_0',
    'https://static.carfromjapan.com/car_7a24e14c-5bd3-4f41-a8aa-ff0bf07f42fb_640_0',
    'https://static.carfromjapan.com/car_52458ddf-6624-452d-b02e-4360901128f1_640_0',
    'https://static.carfromjapan.com/car_47dbfc8c-04a6-40ea-aec1-48af8f2a5d9a_640_0',
    'https://static.carfromjapan.com/car_41c2d04d-f9f9-4c1a-8b3b-a56ff659b40e_640_0'
  ]
  
  vehicle_types = ['Sedan', 'SUV', 'Truck', 'Motorcycle', 'Van', 'Convertible', 'Coupe', 'Hatchback', 'Minivan']
  
  15.times do
    vehicle = Vehicle.new(
      vehicle_type: vehicle_types.sample,
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      colour: Faker::Vehicle.color,
      capacity: Faker::Number.between(from: 2, to: 10),
      price: Faker::Commerce.price(range: 10000..50000, as_string: true),
      image: image_urls.sample
    )

    vehicle.save!    
end

houses_data = []

house_urls = [
  'https://media.istockphoto.com/id/182218173/photo/row-of-townhouses.jpg?s=612x612&w=0&k=20&c=WtWJgO4aauBDVyu4Py9lxuRdtJ4-IPqEygWrIy7Gox8=',
  'https://media.istockphoto.com/id/155419616/photo/cute-house.jpg?s=612x612&w=is&k=20&c=E4gASf76J7OPRA_6pPWX4_EqeyQVA_hEaVrvN0dlzXk=',
  'https://media.gettyimages.com/id/157422319/photo/suburbia-click-for-related-images.jpg?s=612x612&w=gi&k=20&c=KAFKnjE5C5dvPsmwEa89szSkv1phJCPUPRntfoOth5Y=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSfGHSgGqZsX26buHg364jMWpegIiZvIotg-xpgEjN&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiILyYzHBJu4padfCXFY9RmDcTmmaxxR0vR6iHEqKJ&s',
  'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1598228723793-52759bba239c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80'
]

10.times do
  houses_data << {
    house_type: Faker::House.room,
    bedrooms: Faker::Number.between(from: 1, to: 6),
    price: Faker::Number.between(from: 1000000, to: 10000000),
    distance: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    description: Faker::Lorem.sentence,
    image: house_urls.sample
  }
end

# Seed the data into the House model
houses_data.each do |house_data|
  House.create!(house_data)
end

puts "✅ Seed data created successfully."
    
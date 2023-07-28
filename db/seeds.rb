# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'



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
    
#Lands
Land.create([
  {
    name: "Kitengela Milimani Quater Acre",
    location: "Kajiando County",
    size: 0.25,
    price: 1500000,
    description: "A beautiful piece of land in the heart of Kitengela Town.",
    amenities: "Water supply, electricity, schools, Police station",
    image: "https://images.prop24.com/itwqrq72tk5yakjz2ijhifsmvy/Crop237x198",
    proximity_to_road: "5 kilometers",
    messaging: true,
    featured: true
  },
  {
    name: "Kitengela Milimani Phase 4",
    location: "Kitengela",
    size: 0.5,
    price: 4500000,
    description: "Scenic land with a stunning view of the hills.",
    amenities: "Electricity",
    image: "https://images.prop24.com/qh7zh6waeolpnwfp7mbuhmucja/Crop237x198",
    proximity_to_road: "2 kilometer",
    messaging: false,
    featured: false
  },
  
  {
    name: "Home land",
    location: "Kitsuru",
    size: 0.75,
    price: 33000000,
    description: "Land located alongside a beautiful sceneray.",
    amenities: "Water supply, schools, hospitals, police station, train",
    image: "https://images.prop24.com/xx23bi2gvw6yepcbrkgoqldt5e/Crop237x198",
    proximity_to_road: "1 kilometer",
    messaging: true,
    featured: true
  }
])

# Output a message to indicate that seed data has been created
puts "Seed data for lands table created successfully."

#Houses
houses_seed_data = [
  {
    type: "Villa",
    bedrooms: 5,
    price: 35000000,
    distance: 6,
    description: "Beautiful villa with a garden, with 5 bedrooms, all master ensuite, specious kitchen and laundry area",
    image: "https://images.pamgolding.co.za/content/properties/202306/2077120/h/2077120_h_1.jpg?w=600&quality=75",
    is_approved: true,
    featured: true,
    location: "Kitisuru, Kenya"
  },
  {
    type: "Apartment",
    bedrooms: 3,
    price: 9000000,
    distance: 5,
    description: "Cozy apartment 5Kms from the road with 4 bedrooms all masetr ensuite",
    image: "https://images.pamgolding.co.za/content/properties/202211/2039194/h/2039194_h_1.jpg?w=600&quality=75",
    is_approved: true,
    featured: false,
    location: "Syokimau, Kenya"
  }
]

# You can add more houses to the array if needed...

puts "Sample seed data array created!"
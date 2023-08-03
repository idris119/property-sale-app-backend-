# houses

image_urls = [
  'https://www.tatucity.com/wp-content/uploads/Kijani-1-300x225.jpg',
  'https://www.tatucity.com/wp-content/uploads/DJI_0727-1-525x350.jpg',
  'https://langatalinkrealestate.com/wp-content/uploads/2023/07/KAR222S-1.jpg',
  'https://langatalinkrealestate.com/wp-content/uploads/2022/08/KAR288S-5.jpg',
  'https://i.roamcdn.net/prop/brk/listing-medium-600w-watermark/1192c255c4acfe25e668a07868047793/-/prod-property-core-backend-media-brk/5461890/aadb8099-1ee2-4952-a536-7c1edcd445fb.jpg',
  'https://images.homes.com/listings/117/1878522133-861573751-original.jpg',
  'https://images.homes.com/listings/111/5554001233-463318751-original.jpg',
  'https://images.homes.com/listings/111/3639998523-456642651-original.jpg',
  'https://images.homes.com/listings/117/4284052113-114394021-original.jpg',
  'https://images.homes.com/listings/111/4680485072-311249631-original.jpg',
  'https://www.remax-kenya.co.ke/Handlers/GTImageHandler.ashx?src=4a7ORDRuOVqq6YTE6HBgknJ6ATvA9kiZnR29g2cT3C5RF8lNPgV41c9BcPhDTFD3cueyuY%2BXqwYHa0R6dSNvpHdMWx9Q3TTly9W1pkwb0raGWQ0fAh9y5MP%2BqjO5PRcYQWm%2FYzXIhTQ9kQR286QN2vKkHYCfYQiIc%2F0%2FiLUVacHrxCwYAVizGATvXsoFG5yrOzFAHEphWcRupuicYNKgFQ%3D%3D',
]

def generate_house_attributes(image_url)
  {
    location: Faker::Address.city,
    size: rand(100..500),
    bedrooms: rand(2..5),
    bathrooms: rand(1..3),
    price: rand(150_000..600_000),
    distance: rand(1..10),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    amenities: Faker::Lorem.words(number: rand(1..5)).join(', '),
    images: image_url,
    is_approved: [true, false].sample
  }
end

# Create 15 houses with random attributes
15.times do
  house_attributes = generate_house_attributes(image_urls.sample)
  House.create(house_attributes)
end


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
      image: image_urls.sample,
      is_approved: true
    )

    vehicle.save!    
end

Land.create([
{
name: "Kitengela Milimani Quater Acre",
location: "Kajiado County",
size: 0.25,
price: 1500000,
description: "A beautiful piece of land in the heart of Kitengela Town.",
amenities: "Water supply, electricity, schools, Police station",
image: "https://images.prop24.com/itwqrq72tk5yakjz2ijhifsmvy/Crop237x198",
proximity_to_road: "5 kilometers",
messaging: true,
is_approved: true,
featured: true,

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
is_approved: true,
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
is_approved: true,
featured: true
}
])

# Output a message to indicate that seed data has been created
puts "Seed data for lands table created successfully."

require 'faker'

# users
User.destroy_all

# Create new users with unique email and phone_number
User.create!(
  name: 'Baruch',
  email: 'baruch@gmail.com',
  phone_number: '0797877271',
  password: 'bbbbbb',
  is_admin: false
)

User.create!(
  name: 'Consolatta',
  email: 'consolatta@gmail.com',
  phone_number: '0797877272',
  password: 'cccccc',
  is_admin: false
)

User.create!(
  name: 'John',
  email: 'john@gmail.com',
  phone_number: '0797877273',
  password: 'jjjjjj',
  is_admin: false
)

User.create!(
  name: 'Tim',
  email: 'todongoonditi@gmail.com',
  phone_number: '0797877270',
  password: 'timodongo',
  is_admin: true
)

  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png'

puts 'Cleaning Database'

User.destroy_all
Place.destroy_all
Favorite.destroy_all
Activity.destroy_all
ActivityReview.destroy_all
Dog.destroy_all
Guest.destroy_all
Order.destroy_all

puts 'Database cleaned'

puts 'Creating users'
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.characters(11),
    password: '123456',
    remote_avatar_url: url
    )
end

puts '------------'

puts 'Creating dogs'
6.times do
  Dog.create!(
    my_story: Faker::Lorem.sentence(21),
    user_id: rand(1..10),
    name: Faker::Name.name
    )
end

puts '------------'

puts 'Creating places'
10.times do
  Place.create!(
    category: ['restaurant', 'hotel', 'villa', 'park'].sample,
    dogginess_scale: [1, 2, 3, 4, 5].sample,
    user_id: rand(1..10),
    name: Faker::Coffee.blend_name,
    location: ['Canggu shortcut', 'Canggu club', 'Denpasar', 'Seminyak', 'Ubud', 'Ubud Palace', 'Singaraja', 'Uluwatu', 'Uluwatu beach'].sample
    )
end

puts '------------'

puts 'Creating activities'
10.times do
  Activity.create!(
    address: Faker::Address.street_name,
    description: Faker::Lorem.sentence(20),
    date: Time.at(rand * Time.now.to_i),
    name: Faker::Hipster.word,
    category: ['Dance', 'Meetup', 'Brunch', 'Festival', 'Dinner'].sample,
    limit: rand(5..20),
    owner_id: rand(1..10),
    place_id: rand(1..10)
    )
end

puts '------------'

puts 'Creating orders'
Order.create!(
  status: 'Waiting confirmation',
  amount_cents: 500,
  user_id: 1,
  activity_id: 1
  )

Order.create!(
  status: 'Waiting confirmation',
  amount_cents: 100,
  user_id: 2,
  activity_id: 2
  )

Order.create!(
  status: 'Waiting confirmation',
  amount_cents: 10000,
  user_id: 3,
  activity_id: 3
  )

puts '------------'

puts 'Finished seeding!'
puts 'Enjoy!'

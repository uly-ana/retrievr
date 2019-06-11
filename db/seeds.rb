  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png'

puts 'Cleaning Database'

Order.destroy_all
Place.destroy_all
Favorite.destroy_all
ActivityReview.destroy_all
Activity.destroy_all
Dog.destroy_all
Guest.destroy_all
User.destroy_all

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
  plc = Place.create!(
    category: ['restaurant', 'hotel', 'villa', 'park'].sample,
    dogginess_scale: [1, 2, 3, 4, 5].sample,
    user_id: rand(1..10),
    name: Faker::Coffee.blend_name,
    location: ['Canggu shortcut', 'Canggu club', 'Denpasar', 'Seminyak', 'Ubud', 'Ubud Palace', 'Singaraja', 'Uluwatu', 'Uluwatu beach'].sample
    )
  PlacePhoto.create!(
    remote_photo_url: 'https://media-cdn.tripadvisor.com/media/photo-s/16/bf/fb/11/old-mans.jpg',
    place: plc
    )
end

puts '------------'

puts 'Creating activities'
10.times do
  act = Activity.create!(
    address: Faker::Address.street_name,
    description: Faker::Lorem.sentence(20),
    date: Time.at(Time.now + rand(1000000..10000000)),
    name: Faker::Hipster.word,
    category: ['Dance', 'Meetup', 'Brunch', 'Festival', 'Dinner'].sample,
    limit: rand(5..20),
    owner_id: rand(1..10),
    place_id: rand(1..10)
    )
  ActivityPhoto.create!(
    remote_photo_url: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/16BB/production/_106591850_untitleddesign-3.jpg',
    activity: act
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

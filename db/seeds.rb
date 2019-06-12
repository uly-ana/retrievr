require 'csv'
require 'open-uri'
  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png'

dog_stories = ['Yolanda Sevogia\'s neighbor, Stacey Savige, knocked on her door one morning asking if she could keep an eye on a lost terrier she found roaming around the local elementary school. Yolanda agreed to watch the dog, but told Stacey it would only be for the day. The two women took photos of the dog and printed off 4,000 FOUND fliers, stuffed them in mailboxes and also placed an ad on Craigslist.',
  'This photo yanked at the heart-strings of millions of Americans in August 2011, as images of a grieving labrador retriever graced the pages of newspapers across the country. At the funeral of Navy SEAL Jon Tumilson, attendees could see his faithful companion Hawkeye lying by the casket. In front of 1,500 mourners at the beginning of the service, Hawkeye ambled up to the front of the room and laid down next to his master — showing his loyalty until the end.',
  'When this marine returned from deployment, he came home to one of the most excited dogs we\'ve ever seen. Check out this adorable video to see just how happy Buddy was to see his daddy.',
  'The bond between dog and master goes beyond the grave, as evidenced by Capitán\'s unyielding loyalty to his master Miguel Guzmán, from Argentina. Capitán went missing for a few days, but he was eventually found lying in the cemetery next to Guzmán\'s resting place.',
  'This adopted dog proved his worth, and then some. One night Duke woke up his owners by shaking uncontrollably on their bed, trying to get their attention. Their nine-week-old infant Hazel wasn\'t breathing in the other room, and without his intervention they never would have noticed.'
]

# puts 'Cleaning Database'

# Order.destroy_all
# Place.destroy_all
# Favorite.destroy_all
# ActivityReview.destroy_all
# Activity.destroy_all
# Dog.destroy_all
# Guest.destroy_all
# User.destroy_all

# puts 'Database cleaned'

# puts 'Creating users'
# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     username: Faker::Internet.username,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     bio: Faker::Lorem.characters(11),
#     password: '123456',
#     remote_avatar_url: url
#     )
# end

# puts 'Creating Rayhan'

# User.create!(
#   email: 'rayhan.wirjowerdojo@gmail.com',
#   username: 'rayhanw',
#   first_name: 'Rayhan',
#   last_name: 'wirjowerdojo',
#   bio: 'I have a cat, but now I have a dog and I love my dog and cat!!',
#   password: '123456',
#   remote_avatar_url: url
#   )

# puts '---------------'

# puts 'Creating dogs'
# 5.times do
#   i = 0
#   Dog.create!(
#     my_story: dog_stories[i],
#     user_id: rand(1..10),
#     name: Faker::Name.name
#     )
#   i += 1
# end

# puts '---------------'
# file_url = 'https://docs.google.com/spreadsheets/d/10iK0Cju6H6VWgntqRX6Yd9y8mDPBVNfxMabX9SZgL1I/edit?usp=sharing'

# file = 'seed.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seed.csv'))
# p csv_text

User.create!(email: 'rayhan@gmail.com', first_name: 'R', last_name: 'W', password: '121212', bio: 'abcdefghij', username: 'rayhanw')

CSV.foreach(Rails.root.join('lib', 'seeds', 'seed.csv'), csv_options) do |row|
  # puts "#{row['name']} | #{row['description']} | #{row['address']} | #{row['date']} | #{row['price']} | #{row['category']} | #{row['limit of guests']} | #{row['dog_size']}"
  name = row[1]
  desc = row[2]
  address = row[3]
  dates = row[4]
  price = row[5]
  cat = row[6]
  limit = row[7]
  dog_size = row[9]

  act = Activity.create!(
    name: name,
    description: desc,
    address: address,
    time: dates,
    price: price,
    category: cat,
    limit: limit,
    dog_size: dog_size,
    owner: User.first
  )
  ActivityPhoto.create!(
    remote_photo_url: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/16BB/production/_106591850_untitleddesign-3.jpg',
    activity: act
    )
end

# puts '------------'


# puts '------------'

# puts 'Creating places'
# 10.times do
#   plc = Place.create!(
#     category: ['restaurant', 'hotel', 'villa', 'park'].sample,
#     dogginess_scale: [1, 2, 3, 4, 5].sample,
#     user_id: rand(1..10),
#     name: Faker::Coffee.blend_name,
#     location: ['Canggu shortcut', 'Canggu club', 'Denpasar', 'Seminyak', 'Ubud', 'Ubud Palace', 'Singaraja', 'Uluwatu', 'Uluwatu beach'].sample
#     )
#   PlacePhoto.create!(
#     remote_photo_url: 'https://media-cdn.tripadvisor.com/media/photo-s/16/bf/fb/11/old-mans.jpg',
#     place: plc
#     )
# end

# puts '------------'

# puts 'Creating activities'
# 10.times do
#   act = Activity.create!(
#     address: Faker::Address.street_name,
#     description: Faker::Lorem.sentence(20),
#     date: Time.now + rand(1000000..100000000),
#     name: Faker::Hipster.word,
#     category: ['Dance', 'Meetup', 'Brunch', 'Festival', 'Dinner'].sample,
#     limit: rand(5..20),
#     owner_id: rand(1..10),
#     place_id: rand(1..10)
#     )
#   ActivityPhoto.create!(
#     remote_photo_url: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/16BB/production/_106591850_untitleddesign-3.jpg',
#     activity: act
#     )
# end

# puts '------------'

# puts 'Creating orders'
# Order.create!(
#   status: 'Waiting confirmation',
#   amount_cents: 500,
#   user_id: 1,
#   activity_id: 1
#   )

# Order.create!(
#   status: 'Waiting confirmation',
#   amount_cents: 100,
#   user_id: 2,
#   activity_id: 2
#   )

# Order.create!(
#   status: 'Waiting confirmation',
#   amount_cents: 10000,
#   user_id: 3,
#   activity_id: 3
#   )

# puts '------------'

# puts 'Finished seeding!'
# puts 'Enjoy!'

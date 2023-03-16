# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts 'cleaning the database...'
User.destroy_all
Instrument.destroy_all
Reservation.destroy_all

puts 'creating users, instruments and reservations...'

users = [
  {
    name: "benjamin",
    email: "ben@gmail.com",
    password: "123456"
  },
  {
    name: "jantine",
    email: "jantine@gmail.com",
    password: "123456"
  },
  {
    name: "michael",
    email: "michael@gmail.com",
    password: "123456"
  },
  {
    name: "jian",
    email: "jian@gmail.com",
    password: "123456"
  }
]

users.each do |user|
  User.create!(user)
  puts "user created!"
end

instruments = [
  {
    location: 'London',
    model: 'Piano',
    price: 1000,
    user: User.all.sample
  },
  {
    location: 'Berlin',
    model: 'Guitar',
    price: 150,
    user: User.all.sample
  },
  {
    location: 'Birmingham',
    model: 'Flute',
    price: 80,
    user: User.all.sample
  },
  {
    location: 'Glasgow',
    model: 'violin',
    price: 65,
    user: User.all.sample
  },
  {
    location: 'Belfast',
    model: 'Bass',
    price: 200,
    user: User.all.sample
  },
  {
    location: 'Porto',
    model: 'Birimbau',
    price: 300,
    user: User.all.sample
  },
  {
    location: 'Paris',
    model: 'Drums',
    price: 280,
    user: User.all.sample
  },
  {
    location: 'Milan',
    model: 'Cello',
    price: 170,
    user: User.all.sample
  },
  {
    location: 'Madrid',
    model: 'Saxophone',
    price: 80,
    user: User.all.sample
  },
  {
    location: 'Brussels',
    model: 'Triangle',
    price: 10,
    user: User.all.sample
  }
]

photos_instrument_url = ['https://steinway.co.uk/wp-content/uploads/2020/08/Essex-173-1024x576.png',
  'https://images.guitarguitar.co.uk/cdn/small/160/753_bodysizes_little%20martin.jpg',
  'https://cdn.images.fecom-media.com/FE00015299/images/Sonata%20Student%20Flute%20-%20open%20case%20and%20built%20flute.jpg',
  'https://caswells-strings.co.uk/wp-content/uploads/2012/11/p200-violin-outfit.jpg',
  'https://d1aeri3ty3izns.cloudfront.net/media/31/310922/600/preview_1.jpg',
  'https://centerforworldmusic.org/wp-content/uploads/2015/06/berimbaus04_1-1030x684.jpg',
  'https://cdn.shopify.com/s/files/1/0364/6701/5819/products/PP250BLK_1.jpg',
  'https://d1aeri3ty3izns.cloudfront.net/media/57/571117/1200/preview.jpg',
  'https://d1aeri3ty3izns.cloudfront.net/media/41/414314/600/preview.jpg',
  'https://media.npr.org/assets/img/2014/07/05/triangle_wide-401b9d28d1c793170b080d1ed11628b8d82a50fc-s1400-c100.jpg']

instruments_id = []

instruments.each do |instrument|
  instrument = Instrument.new(
    model: instrument[:model],
    location: instrument[:location],
    price: instrument[:price],
    user: instrument[:user]
  )
  instrument.save!
  instruments_id << instrument.id
  puts "instrument created!"
end

instruments_id.zip(photos_instrument_url).each do |instrument_id, photo_url|
  puts "Setting photo for instrument #{instrument_id} from URL #{photo_url}"
  photo = URI.open(photo_url)
  instrument = Instrument.find(instrument_id)
  instrument.photo.attach(io: photo, filename: "#{rand(1...1000)}_instrument.png")
end

reservations = [
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'pending',
    user: User.all.sample,
    instrument: Instrument.all.sample
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'pending',
    user: User.all.sample,
    instrument: Instrument.all.sample
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'accepted',
    user: User.all.sample,
    instrument: Instrument.all.sample
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'accepted',
    user: User.all.sample,
    instrument: Instrument.all.sample
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'rejected',
    user: User.all.sample,
    instrument: Instrument.all.sample
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'rejected',
    user: User.all.sample,
    instrument: Instrument.all.sample
  }
]

reservations.each do |reservation|
  Reservation.create!(reservation)
  puts "reservation created!"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
    password: "123456",
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
    price: 100,
    user: User.last
  },
  {
    location: 'Berlin',
    model: 'guitar',
    price: 150,
    user: User.last
  },
  {
    location: 'Birmingham',
    model: 'flute',
    price: 80,
    user: User.last
  },
  {
    location: 'Glasgow',
    model: 'violin',
    price: 65,
    user: User.last
  },
  {
    location: 'Belfast',
    model: 'Bass',
    price: 200,
    user: User.last
  },
  {
    location: 'Belfast',
    model: 'Birimbau',
    price: 300,
    user: User.last
  }
]

instruments.each do |instrument|
  Instrument.create!(instrument)
  puts "instrument created!"
end

reservations = [
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'pending',
    user: User.first,
    instrument: Instrument.last
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'pending',
    user: User.first,
    instrument: Instrument.last
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'accepted',
    user: User.first,
    instrument: Instrument.last
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'accepted',
    user: User.first,
    instrument: Instrument.last
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'rejected',
    user: User.first,
    instrument: Instrument.last
  },
  {
    start_date: Date.today,
    end_date: Date.today + 1.week,
    status: 'rejected',
    user: User.first,
    instrument: Instrument.last
  }
]

reservations.each do |reservation|
  Reservation.create!(reservation)
  puts "reservation created!"
end

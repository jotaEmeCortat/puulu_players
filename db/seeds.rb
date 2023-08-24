# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database'
# Booking.destroy_all
Player.destroy_all
User.destroy_all
Stat.destroy_all

3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6)
  )
  user.save!
end

10.times do
  nationality = Geocoder.search(Faker::Address.country).first
  if nationality
    latitude = nationality.latitude
    longitude = nationality.longitude
  else
    latitude = nil
    longitude = nil
  end

  player = Player.new(
    player_name: Faker::Name.name,
    player_email: Faker::Internet.email,
    player_nationality: nationality.country,
    player_gender: "Male",
    player_description: "Puulu",
    player_date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 45),
    player_position: "#{["2ML", "Center", "2MR", "5MBL", "5MBC", "5MBR"].sample}",
    player_role: "#{["Attaquant", "Goalkeeper"].sample}",
    player_handedness: "#{['Right', 'Left', 'Ambidextrous'].sample}",
    player_social: Faker::Internet.username,
    player_avatar_image: Faker::LoremFlickr.image(search_terms: ['water-polo']),
    player_banner_image: Faker::LoremFlickr.image(search_terms: ['landscape']),
    player_availability_period: "#{rand(0..1)}",
    player_availability: "#{["1 Week", "2 Weeks", "3 Weeks", "1 Month", "6 Months", "Whole Season"].sample}",
    player_rating: rand(1..10),
    player_price: rand(1_000..50_000),
    user: User.all.sample,
    latitude: latitude,
    longitude: longitude
  )
  player.save!
end

10.times do
  stat = Stat.new(
    height: Faker::Measurement.metric_height,
    weight: Faker::Measurement.metric_weight,
    appearances: rand(1..500),
    goal_accuracy: Faker::Number.within(range: 0.0..1.0),
    goal_5m: rand(1..500),
    goal_h_plus: rand(1..500),
    goal_save: rand(1..500),
    exclusion_conceded: rand(1..500),
    exclusion_success: rand(1..500),
    ratio: Faker::Number.within(range: 0.0..1.0),
    player: Player.all.sample
  )
  stat.save!
end

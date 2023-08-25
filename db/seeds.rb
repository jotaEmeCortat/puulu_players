# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database'
puts ''
# Booking.destroy_all
Player.destroy_all
User.destroy_all
Stat.destroy_all


puts "Creating USERS"
puts '---'

count = 0

3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    team_name: Faker::WorldCup.team,
    team_country: Faker::Address.country,
    team_description: Faker::ChuckNorris.fact,
    team_badge_image: Faker::Placeholdit.image(size: '300x300', format: 'jpg', background_color: :random, text_color: :random, text: 'AVATAR'),
    team_banner_image: Faker::Placeholdit.image(size: '600x300', format: 'jpg', background_color: :random, text_color: :random, text: 'BANNER'),
    team_rating: rand(1..5)
  )
  user.save!

  count += 1
  puts "Creating #{user.team_name}"
  puts ''
end


puts "Creating PLAYERS"
puts '---'
count = 0

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
    player_gender: Faker::Gender.binary_type,
    player_description: Faker::Hacker.say_something_smart,
    player_date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 45),
    player_position: "#{["2ML", "CENTER", "2MR", "5MBL", "5MBC", "5MBR"].sample}",
    player_role: "#{["OFFENSE", "DEFENSE","GOALKEEPER"].sample}",
    player_handedness: "#{['RIGHT', 'LEFT', 'AMBIDEXTROUS'].sample}",
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

  count += 1
  puts "Creating #{player.player_name}"
  puts ''
end


puts "Creating STATS"
puts '---'
count = 0

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

  count += 1
  puts "Creating stats for #{stat.player.id}"
  puts '---'
end

puts "Seeding complete !"

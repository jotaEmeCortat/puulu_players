# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

picture_array = [ "https://images.unsplash.com/photo-1584646270728-a7d853d78d67?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1598&q=80",
  "https://images.unsplash.com/photo-1553788195-e0fd80c655d2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1582732142755-c575e698599d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1632&q=80",
  "https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2103&q=80",
  "https://images.unsplash.com/photo-1586684075772-746ed499fbf1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1505705694340-019e1e335916?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2089&q=80",
  "https://images.unsplash.com/photo-1560203452-a76df38ba8fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2090&q=80",
  "https://images.unsplash.com/photo-1549216963-72c1712c1196?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1559348349-86f1f65817fe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80"
]

puts 'Cleaning database'
puts ''
# Booking.destroy_all
Player.destroy_all
User.destroy_all
Stat.destroy_all

puts "Creating USERS"
puts '---'

count = 0

user = User.new(
    email: "test@test.com",
    password: "123456",
    team_name: Faker::WorldCup.team,
    team_country: Faker::Address.country,
    team_description: Faker::ChuckNorris.fact,
    team_badge_image: "",
    team_banner_image: "",
    team_rating: rand(1..5)
  )
  user.save!

  count += 1
  puts "Creating #{user.team_name}"
  puts ''

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

    file = URI.open(picture_array[count])
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
      player_avatar_image: "",
      player_banner_image: "",
      player_availability_period: "#{rand(0..1)}",
      player_availability: "",
      player_rating: rand(1..10),
      player_price: rand(1_000..50_000),
      user: User.all.sample,
      latitude: latitude,
      longitude: longitude
    )
    player.player_avatar_image.attach(io: file, filename: "file.png", content_type: "image/png")
    player.save!

    count += 1
    puts "Creating #{player.player_name}"
    puts ''
  end

puts "Seeding complete !"


# puts 'Cleaning database'
# puts ''
# # Booking.destroy_all
# Player.destroy_all
# User.destroy_all
# Stat.destroy_all


# puts "Creating USERS"
# puts '---'

# count = 0

# 3.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(min_length: 6),
#     team_name: Faker::WorldCup.team,
#     team_country: Faker::Address.country,
#     team_description: Faker::ChuckNorris.fact,
#     team_badge_image: Faker::Placeholdit.image(size: '300x300', format: 'jpg', background_color: :random, text_color: :random, text: 'AVATAR'),
#     team_banner_image: Faker::Placeholdit.image(size: '600x300', format: 'jpg', background_color: :random, text_color: :random, text: 'BANNER'),
#     team_rating: rand(1..5)
#   )
#   user.save!

#   count += 1
#   puts "Creating #{user.team_name}"
#   puts ''
# end


# puts "Creating PLAYERS"
# puts '---'
# count = 0

# 10.times do
#   nationality = Geocoder.search(Faker::Address.country).first
#   if nationality
#     latitude = nationality.latitude
#     longitude = nationality.longitude
#   else
#     latitude = nil
#     longitude = nil
#   end

#   player = Player.new(
#     player_name: Faker::Name.name,
#     player_email: Faker::Internet.email,
#     player_nationality: nationality.country,
#     player_gender: Faker::Gender.binary_type,
#     player_description: Faker::Hacker.say_something_smart,
#     player_date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 45),
#     player_position: "#{["2ML", "CENTER", "2MR", "5MBL", "5MBC", "5MBR"].sample}",
#     player_role: "#{["OFFENSE", "DEFENSE","GOALKEEPER"].sample}",
#     player_handedness: "#{['RIGHT', 'LEFT', 'AMBIDEXTROUS'].sample}",
#     player_social: Faker::Internet.username,
#     player_avatar_image: Faker::LoremFlickr.image(search_terms: ['water-polo']),
#     player_banner_image: Faker::LoremFlickr.image(search_terms: ['landscape']),
#     player_availability_period: "#{rand(0..1)}",
#     player_availability: "#{["1 Week", "2 Weeks", "3 Weeks", "1 Month", "6 Months", "Whole Season"].sample}",
#     player_rating: rand(1..10),
#     player_price: rand(1_000..50_000),
#     user: User.all.sample,
#     latitude: latitude,
#     longitude: longitude
#   )
#   player.save!

#   count += 1
#   puts "Creating #{player.player_name}"
#   puts ''
# end


# puts "Creating STATS"
# puts '---'
# count = 0

# 10.times do
#   stat = Stat.new(
#     height: Faker::Measurement.metric_height,
#     weight: Faker::Measurement.metric_weight,
#     appearances: rand(1..500),
#     goal_accuracy: Faker::Number.within(range: 0.0..1.0),
#     goal_5m: rand(1..500),
#     goal_h_plus: rand(1..500),
#     goal_save: rand(1..500),
#     exclusion_conceded: rand(1..500),
#     exclusion_success: rand(1..500),
#     ratio: Faker::Number.within(range: 0.0..1.0),
#     player: Player.all.sample
#   )
#   stat.save!

#   count += 1
#   puts "Creating stats for #{stat.player.id}"
#   puts '---'
# end

# puts "Seeding complete !"

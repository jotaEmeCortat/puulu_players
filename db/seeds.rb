# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1.times do
  player = Player.new(
    player_name: Faker::Name.name,
    player_email: Faker::Internet.email,
    player_nationality: Faker::Address.country,
    player_gender: "Male",
    player_description: "Puulu",
    player_date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 45),
    player_position: "#{["2ML", "Center", "2MR", "5MBL", "5MBC", "5MBR"].shuffle}",
    player_role: "#{["Attaquant", "Goalkeeper"].shuffle}",
    player_handedness: "#{['Right', 'Left', 'Ambidextrous'].shuffle}",
    player_social: Faker::Internet.username,
    player_avatar_image: "https://media.licdn.com/dms/image/C5603AQFW19zfimIcCg/profile-displayphoto-shrink_800_800/0/1517248020028?e=1698278400&v=beta&t=YMnGqiDB4yeWEmaf6V5TBGK5sXYvogVbEH6u5lYO7-Y",
    player_banner_image: "https://upload.wikimedia.org/wikipedia/fr/c/c7/Logo_de_la_Fédération_Algérienne_de_football.png",
    player_availability_period: "#{["Available", "Not Available"].shuffle}",
    player_availability: "#{["1 Week", "2 Weeks", "3 Weeks", "1 Month", "6 Months", "Whole Season"].shuffle}",
    player_rating: rand(1..10),
    player_price: rand(1_000..50_000)
    # user: un user
  )
  player.save!
end

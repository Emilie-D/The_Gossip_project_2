# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gem 'faker'

10.times do
	user = User.create!(first_name: Faker::JapaneseMedia::DragonBall.character, last_name: Faker::Games::Pokemon.name, description: Faker::Movies::HarryPotter.quote, email: Faker::Internet.email, age: Faker::Number.number(2), city_id: rand(1..10), password: Faker::Number.number(6))	
end

5.times do
	gossip = Gossip.create!(title: Faker::TvShows::Simpsons.character, content: Faker::TvShows::Simpsons.quote, user_id: rand(1..10))
end

10.times do 
	city = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Number.number(5))
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing the Database...."
Organization.destroy_all
Sport.destroy_all
User.destroy_all
Athlete.destroy_all


puts "Generating Athletes"

masters = Organization.create!(
  name: 'Masters'
  )

golf = Sport.create!(
  name: 'golf'
  )

user_attributes = {
  email: 'coachie@email.com',
  password: 'coachiecoach',
  first_name: 'Butch',
  last_name: 'Harmon',

}
user = User.new(user_attributes)
user.organization = masters
user.sport = golf
user.save

puts "Generated #{user.name} user"

25.times do
  athlete = Athlete.create!( first_name: Faker::Name.female_first_name,
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  team: Faker::Team.name,
                  team_url: "www.#{Faker::Team.name}.com",
                  nationality: Faker::Nation.nationality,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3))
  puts "Generated #{athlete.name}"
end


puts "Generated #{user.name} user"
puts "Generated #{Athlete.count} athletes"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing the Database...."
ScheduleEvent.destroy_all
Schedule.destroy_all
Appearance.destroy_all
AthleteEvent.destroy_all
Event.destroy_all
Recruit.destroy_all
Athlete.destroy_all
User.destroy_all
Organization.destroy_all
Sport.destroy_all


puts "Generating Coach & Athletes"

@masters = Organization.create!(
  name: 'Masters'
  )

@golf = Sport.create!(
  name: 'golf'
  )

user_attributes = {
  email: 'coachie@email.com',
  password: 'coachiecoach',
  first_name: 'Butch',
  last_name: 'Harmon'
}

user = User.new(user_attributes)
user.organization = @masters
user.sport = @golf
user.save

puts "Generated #{user.first_name} #{user.last_name} user"

25.times do
  athlete = Athlete.create!( first_name: Faker::Name.female_first_name,
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  team: Faker::Team.name,
                  team_url: "www.#{Faker::Team.name}.com",
                  nationality: Faker::Nation.nationality,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3))
  puts "Generated #{athlete.first_name} #{athlete.last_name}"
end

puts "Generated #{Athlete.count} athletes"


athlete1 = Athlete.first
athlete2 = Athlete.second
athlete3 = Athlete.third
athlete4 = Athlete.fourth
athlete5 = Athlete.fifth

schedule = Schedule.create!(user: user)

# events = []
# 25.time do
#   event = Event.create!(start_date: Faker::Date.between(from: 30.days.ago, to: Date.today),
#                         location: Faker::Address.full_address)
#   events << event
# end

# appearence = Appearance.create!(event: events.sample, recruit: recruits.sample)


recruit1 = Recruit.create!(athlete: athlete1, user: user)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit1)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit1.athlete.first_name}"
end


recruit2 = Recruit.create!(athlete: athlete2, user: user)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit2)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit2.athlete.first_name}"
end


recruit3 = Recruit.create!(athlete: athlete3, user: user)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit3)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit3.athlete.first_name}"
end


recruit4 = Recruit.create!(athlete: athlete4, user: user)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit4)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit4.athlete.first_name}"
end


recruit5 = Recruit.create!(athlete: athlete5, user: user)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit5)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit5.athlete.first_name}"
end

schedule2 = Schedule.create!(user: user)
recruits = [recruit1, recruit2, recruit3, recruit4, recruit5]

15.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        location: Faker::Address.full_address,
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruits.sample)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)
end


# Need to prioritize games that have overlapping recruits
# Need to only see one recruit 3 times in a Schedule

# schedule = Schedule.create!(user: user)

# Event.find_each do |event|
#   schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
# end
# Schedule = Schedule.create!(user: user)

# Event.find_each do |event|
#   Schedule_event = ScheduleEvent.create!(event: event, Schedule: Schedule)
# end




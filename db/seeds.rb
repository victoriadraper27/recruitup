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
Message.destroy_all
UnavailableDay.destroy_all
User.destroy_all
Team.destroy_all
Chatroom.destroy_all
Organization.destroy_all
Sport.destroy_all


puts "Generating the Chatroom"
puts "Generating Coaches & Athletes"

lpga = Organization.create!(
  name: 'Ladies Professional Golf Association'
  )

golf = Sport.create!(
  name: 'Golf'
  )

chatroom = Chatroom.create!(name: "Chat")

team = Team.new(name: 'Legacy')
team.organization = lgpa
team.sport = golf
team.chatroom = chatroom
team.save!

user_attributes = {
  email: 'coachie@email.com',
  password: 'coachiecoach',
  first_name: 'Pia',
  last_name: 'Nilsson',
}

user2_attributes = {
  email: 'assist@email.com',
  password: 'assistant',
  first_name: 'Lynn',
  last_name: 'Marriot',
  role: 'Assistant Coach'
}

user = User.new(user_attributes)
user.team = team
user.save!

user2 = User.new(user2_attributes)
user2.team = team
user2.save!

5.times do
  udays = UnavailableDay.create!(
          date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
          user: user )
end

5.times do
  udays2 = UnavailableDay.create!(
          date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
          user: user2 )
end



puts "Generated #{user.first_name} #{user.last_name} user"
puts "Generated #{user2.first_name} #{user2.last_name} user"


schedule = Schedule.create!(team: team)


25.times do
  athlete_team_name = Faker::Team.name
  athlete = Athlete.create!( first_name: Faker::Name.female_first_name,
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/, '')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3))
  puts "Generated #{athlete.first_name} #{athlete.last_name}"
end

puts "Generated #{Athlete.count} athletes"


athlete1 = Athlete.first
athlete2 = Athlete.second
athlete3 = Athlete.third
athlete4 = Athlete.fourth
athlete5 = Athlete.fifth


# events = []
# 25.time do
#   event = Event.create!(start_date: Faker::Date.between(from: 30.days.ago, to: Date.today),
#                         address: Faker::Address.full_address)
#   events << event
# end

# appearence = Appearance.create!(event: events.sample, recruit: recruits.sample)


recruit1 = Recruit.create!(athlete: athlete1, team: team)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "2000 Visalia Row, Coronado, CA 92118, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit1)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit1.athlete.first_name}"
end


recruit2 = Recruit.create!(athlete: athlete2, team: team)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "6320 Grandview Dr W, University Place, WA 98467, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit2)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit2.athlete.first_name}"
end


recruit3 = Recruit.create!(athlete: athlete3, team: team)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "Van Cortlandt Park S, The Bronx, NY 10463, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit3)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit3.athlete.first_name}"
end


recruit4 = Recruit.create!(athlete: athlete4, team: team)
3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "1700 W Renwick Rd, Romeoville, IL 60446, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit4)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit4.athlete.first_name}"
end


recruit5 = Recruit.create!(athlete: athlete5, team: team)

3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "600 Delaware Springs Blvd, Burnet, TX 78611, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit5)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)

  puts "Generated event on #{event.start_date} with recruit #{recruit5.athlete.first_name}"
end

schedule2 = Schedule.create!(team: team)
recruits = [recruit1, recruit2, recruit3, recruit4, recruit5]

5.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "Ankerveien 127, 0766 Oslo, Norway",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruits.sample)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)
end

5.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "N1, Sidi Bouknadel, Morocco",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruits.sample)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)
end

5.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
                        address: "2600 Constitution Ave, Prattville, AL 36066, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruits.sample)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)
end

# Need to prioritize games that have overlapping recruits
# Need to only see one recruit 3 times in a Schedule

# schedule = Schedule.create!(user: user)

# Event.find_each do |event|
#   schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
#   schedule_event = ScheduleEvent.create!(event: event, Schedule: Schedule)
# end
# Schedule = Schedule.create!(user: user)

# Event.find_each do |event|
#   Schedule_event = ScheduleEvent.create!(event: event, Schedule: Schedule)
# end




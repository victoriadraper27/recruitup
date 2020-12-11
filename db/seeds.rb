# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


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
team.organization = lpga
team.sport = golf
team.chatroom = chatroom
team.save!

user_attributes = {
  email: 'coachie@email.com',
  password: 'coachiecoach',
  first_name: 'Pia',
  last_name: 'Nilsson'
}

user2_attributes = {
  email: 'assist@email.com',
  password: 'assistant',
  first_name: 'Lynn',
  last_name: 'Marriot',
  role: 'Assistant Coach'
}

user3_attributes = {
  email: 'other@email.com',
  password: 'otherassistant',
  first_name: 'Mary',
  last_name: 'Ritchie',
  role: 'Assistant Coach'
}

file_pia = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607481093/pia_nilsson_copy_gkxkjf.png')
user = User.new(user_attributes)
user.team = team
user.photo.attach(io: file_pia, filename: 'pia.png', content_type: 'image/png')
user.save!

file_lynn = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607481106/lynn_marriot_copy_mwhnl4.png')
user2 = User.new(user2_attributes)
user2.team = team
user2.photo.attach(io: file_lynn, filename: 'lynn.png', content_type: 'image/png')
user2.save!

file_mary = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607569394/Coach_Ritchie_2019_e80o8l.png')
user3 = User.new(user3_attributes)
user3.team = team
user3.photo.attach(io: file_mary, filename: 'mary.png', content_type: 'image/png')
user3.save!

1.times do
  udays = UnavailableDay.create!(
          date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
          user: user )
end

1.times do
  udays2 = UnavailableDay.create!(
          date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
          user: user2 )

1.times do
  udays3 = UnavailableDay.create!(
          date: Faker::Date.between(from: Date.today, to: 45.days.from_now),
          user: user3 )
end



puts "Generated #{user.first_name} #{user.last_name} user"
puts "Generated #{user2.first_name} #{user2.last_name} user"


schedule = Schedule.create!(team: team)

file1 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607395280/athlete35.jpg')
file2 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607395447/athlete40.jpg')
file3 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388862/athlete30.jpg')
file4 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607395412/athlete41.jpg')
file5 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388778/athlete25.jpg')
file6 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388410/athlete20.jpg')
file7 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607341660/athlete13.jpg')
file8 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388535/athlete24.jpg')
file9 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388339/athlete21.jpg')
file10 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388514/athlete19.jpg')
file11 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607341179/athlete16.jpg')
file12 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607340963/athlete2.jpg')
file13 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607341062/athlete3.jpg')
file14 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607340963/athlete2.jpg')
file15 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607340921/athlete4.jpg')
file16 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607340833/athlete15.jpg')
file17 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339838/athlete14.jpg')
file18 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339554/athlete11.jpg')
file19 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339532/athlete10.jpg')
file20 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339382/athlete8.jpg')
file21 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339296/athlete6.jpg')
file22 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607339284/athlete5.jpg')
file23 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607341145/athlete17.jpg')
file24 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388627/athlete26.jpg')
file25 = URI.open('https://res.cloudinary.com/jvr-projects/image/upload/v1607388901/athlete28.jpg')


athletes = []


  athlete_team_name = Faker::University.name
  athlete1 = Athlete.new( first_name: 'Ruby',
                  last_name: 'Kim',
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: 'South Korea',
                  rating: 871,
                  )
  athlete1.photo.attach(io: file1, filename: 'athlete1.jpg', content_type: 'image/jpg')
  athlete1.save!
  athletes << athlete1
  puts "Generated #{athlete1.first_name} #{athlete1.last_name}"

 athlete_team_name = Faker::University.name
  athlete2 = Athlete.new( first_name: 'Karen',
                  last_name: Faker::Name.last_name,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete2.photo.attach(io: file2, filename: 'athlete2.jpg', content_type: 'image/jpg')
  athlete2.save!
  athletes << athlete2
  puts "Generated #{athlete2.first_name} #{athlete2.last_name}"

 athlete_team_name = Faker::University.name
  athlete3 = Athlete.new( first_name: 'Jennifer',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete3.photo.attach(io: file3, filename: 'athlete3.jpg', content_type: 'image/jpg')
  athlete3.save!
  athletes << athlete3
  puts "Generated #{athlete3.first_name} #{athlete3.last_name}"

 athlete_team_name = Faker::University.name
  athlete4 = Athlete.new( first_name: 'Rachael',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete4.photo.attach(io: file4, filename: 'athlete4.jpg', content_type: 'image/jpg')
  athlete4.save!
  athletes << athlete4
  puts "Generated #{athlete4.first_name} #{athlete4.last_name}"

 athlete_team_name = Faker::University.name
  athlete5 = Athlete.new( first_name: 'Victoria',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete5.photo.attach(io: file5, filename: 'athlete5.jpg', content_type: 'image/jpg')
  athlete5.save!
  athletes << athlete5
  puts "Generated #{athlete5.first_name} #{athlete5.last_name}"

 athlete_team_name = Faker::University.name
  athlete6 = Athlete.new( first_name: 'Rachael',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete6.photo.attach(io: file6, filename: 'athlete6.jpg', content_type: 'image/jpg')
  athlete6.save!
  athletes << athlete6
  puts "Generated #{athlete6.first_name} #{athlete6.last_name}"

 athlete_team_name = Faker::University.name
  athlete7 = Athlete.new( first_name: 'Cindy',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete7.photo.attach(io: file7, filename: 'athlete7.jpg', content_type: 'image/jpg')
  athlete7.save!
  athletes << athlete7
  puts "Generated #{athlete7.first_name} #{athlete7.last_name}"

 athlete_team_name = Faker::University.name
  athlete8 = Athlete.new( first_name: 'Sarah',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete8.photo.attach(io: file8, filename: 'athlete8.jpg', content_type: 'image/jpg')
  athlete8.save!
  athletes << athlete8
  puts "Generated #{athlete8.first_name} #{athlete8.last_name}"

 athlete_team_name = Faker::University.name
  athlete9 = Athlete.new( first_name: 'Emma',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete9.photo.attach(io: file9, filename: 'athlete9.jpg', content_type: 'image/jpg')
  athlete9.save!
  athletes << athlete9
  puts "Generated #{athlete9.first_name} #{athlete9.last_name}"

 athlete_team_name = Faker::University.name
  athlete10 = Athlete.new( first_name: 'Abby',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete10.photo.attach(io: file10, filename: 'athlete10.jpg', content_type: 'image/jpg')
  athlete10.save!
  athletes << athlete10
  puts "Generated #{athlete10.first_name} #{athlete10.last_name}"

 athlete_team_name = Faker::University.name
  athlete11 = Athlete.new( first_name: 'Lily',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete11.photo.attach(io: file11, filename: 'athlete11.jpg', content_type: 'image/jpg')
  athlete11.save!
  athletes << athlete11
  puts "Generated #{athlete11.first_name} #{athlete11.last_name}"

 athlete_team_name = Faker::University.name
  athlete12 = Athlete.new( first_name: 'Chloe',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete12.photo.attach(io: file12, filename: 'athlete12.jpg', content_type: 'image/jpg')
  athlete12.save!
  athletes << athlete12
  puts "Generated #{athlete12.first_name} #{athlete12.last_name}"

 athlete_team_name = Faker::University.name
  athlete13 = Athlete.new( first_name: 'Lucy',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete13.photo.attach(io: file13, filename: 'athlete13.jpg', content_type: 'image/jpg')
  athlete13.save!
  athletes << athlete13
  puts "Generated #{athlete13.first_name} #{athlete13.last_name}"

 athlete_team_name = Faker::University.name
  athlete14 = Athlete.new( first_name: 'Hannah',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete14.photo.attach(io: file14, filename: 'athlete14.jpg', content_type: 'image/jpg')
  athlete14.save!
  athletes << athlete14
  puts "Generated #{athlete14.first_name} #{athlete14.last_name}"

 athlete_team_name = Faker::University.name
  athlete15 = Athlete.new( first_name: 'Sofie',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete15.photo.attach(io: file15, filename: 'athlete15.jpg', content_type: 'image/jpg')
  athlete15.save!
  athletes << athlete15
  puts "Generated #{athlete15.first_name} #{athlete15.last_name}"

 athlete_team_name = Faker::University.name
  athlete16 = Athlete.new( first_name: 'Maria',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete16.photo.attach(io: file16, filename: 'athlete16.jpg', content_type: 'image/jpg')
  athlete16.save!
  athletes << athlete16
  puts "Generated #{athlete16.first_name} #{athlete16.last_name}"

 athlete_team_name = Faker::University.name
  athlete17 = Athlete.new( first_name: 'Ashley',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete17.photo.attach(io: file17, filename: 'athlete17.jpg', content_type: 'image/jpg')
  athlete17.save!
  athletes << athlete17
  puts "Generated #{athlete17.first_name} #{athlete17.last_name}"

 athlete_team_name = Faker::University.name
  athlete18 = Athlete.new( first_name: 'Haley',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete18.photo.attach(io: file18, filename: 'athlete18.jpg', content_type: 'image/jpg')
  athlete18.save!
  athletes << athlete18
  puts "Generated #{athlete18.first_name} #{athlete18.last_name}"

 athlete_team_name = Faker::University.name
  athlete19 = Athlete.new( first_name: 'Courtney',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete19.photo.attach(io: file19, filename: 'athlete19.jpg', content_type: 'image/jpg')
  athlete19.save!
  athletes << athlete19
  puts "Generated #{athlete19.first_name} #{athlete19.last_name}"

 athlete_team_name = Faker::University.name
  athlete20 = Athlete.new( first_name: 'Jenna',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete20.photo.attach(io: file20, filename: 'athlete20.jpg', content_type: 'image/jpg')
  athlete20.save!
  athletes << athlete20
  puts "Generated #{athlete20.first_name} #{athlete20.last_name}"

 athlete_team_name = Faker::University.name
  athlete21 = Athlete.new( first_name: 'Kaitlin',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete21.photo.attach(io: file21, filename: 'athlete21.jpg', content_type: 'image/jpg')
  athlete21.save!
  athletes << athlete21
  puts "Generated #{athlete21.first_name} #{athlete21.last_name}"

 athlete_team_name = Faker::University.name
  athlete22 = Athlete.new( first_name: 'Kendall',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: Faker::Number.decimal(l_digits: 3, r_digits: 3)
                  )
  athlete22.photo.attach(io: file22, filename: 'athlete22.jpg', content_type: 'image/jpg')
  athlete22.save!
  athletes << athlete22
  puts "Generated #{athlete22.first_name} #{athlete22.last_name}"


 athlete_team_name = Faker::University.name
  athlete23 = Athlete.new( first_name: 'Maggie',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: 227
                  )
  athlete23.photo.attach(io: file23, filename: 'athlete23.jpg', content_type: 'image/jpg')
  athlete23.save!
  athletes << athlete23
  puts "Generated #{athlete23.first_name} #{athlete23.last_name}"

 athlete_team_name = Faker::University.name
  athlete24 = Athlete.new( first_name: 'Sam',
                  last_name: Faker::Name.last_name  ,
                  grad_year: 2025,
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: 716
                  )
  athlete24.photo.attach(io: file24, filename: 'athlete24.jpg', content_type: 'image/jpg')
  athlete24.save!
  athletes << athlete24
  puts "Generated #{athlete24.first_name} #{athlete24.last_name}"

 athlete_team_name = Faker::University.name
  athlete25 = Athlete.new( first_name: 'Rebecca',
                  last_name: Faker::Name.last_name  ,
                  grad_year: rand(2022..2025),
                  athlete_team: athlete_team_name,
                  athlete_team_url: "www.#{athlete_team_name.downcase.gsub(/\s+/,'')}.com",
                  nationality: Faker::WorldCup.team,
                  rating: 842
                  )
  athlete25.photo.attach(io: file25, filename: 'athlete25.jpg', content_type: 'image/jpg')
  athlete25.save!
  athletes << athlete25
  puts "Generated #{athlete25.first_name} #{athlete25.last_name}"

  puts "Generated #{Athlete.count} athletes"


athlete1 = Athlete.first
athlete2 = Athlete.second
athlete3 = Athlete.third
athlete4 = Athlete.fourth
athlete5 = Athlete.fifth

athletes_2 = [athlete1, athlete2, athlete3, athlete4, athlete5]


# events = []
# 25.time do
#   event = Event.create!(start_date: Faker::Date.between(from: 30.days.ago, to: Date.today),
#                         address: Faker::Address.full_address)
#   events << event
# end

# appearence = Appearance.create!(event: events.sample, recruit: recruits.sample)

athletes_3 = athletes - athletes_2

athletes_3.each do |athlete|
  3.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today + 3, to: 45.days.from_now),
                        address: "2000 Visalia Row, Coronado, CA 92118, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  athlete_event = AthleteEvent.create!(event: event, athlete: athlete)
  end
end

athletes_3.each do |athlete|
  2.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today + 3, to: 45.days.from_now),
                        address: "2000 Visalia Row, Coronado, CA 92118, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  athlete_event = AthleteEvent.create!(event: event, athlete: athlete)
  end
end


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



# manufactured previous events
puts "Manufacturing Previous Events for Both Calendars"

1.times do
  event = Event.create!(start_date: Date.today,
                        address: "2000 Visalia Row, Coronado, CA 92118, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit1)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)

  puts "Generated event on #{event.start_date} with recruit #{recruit1.athlete.first_name}"
end

1.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today - 10, to: Date.today - 1),
                        address: "6320 Grandview Dr W, University Place, WA 98467, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit2)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)

  puts "Generated event on #{event.start_date} with recruit #{recruit2.athlete.first_name}"
end

1.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today - 10, to: Date.today - 1),
                        address: "Van Cortlandt Park S, The Bronx, NY 10463, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit3)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)

  puts "Generated event on #{event.start_date} with recruit #{recruit3.athlete.first_name}"
end


1.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today - 10, to: Date.today - 1),
                        address: "1700 W Renwick Rd, Romeoville, IL 60446, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit4)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)

  puts "Generated event on #{event.start_date} with recruit #{recruit4.athlete.first_name}"
end


1.times do
  event = Event.create!(start_date: Faker::Date.between(from: Date.today - 10, to: Date.today - 1),
                        address: "600 Delaware Springs Blvd, Burnet, TX 78611, United States",
                        start_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all))
  appearence = Appearance.create!(event: event, recruit: recruit5)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule)
  schedule_event = ScheduleEvent.create!(event: event, schedule: schedule2)

  puts "Generated event on #{event.start_date} with recruit #{recruit5.athlete.first_name}"
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




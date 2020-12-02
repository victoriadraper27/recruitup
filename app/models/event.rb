class Event < ApplicationRecord
  has_many :schedule_events
  has_many :schedules, through: :schedule_events
  has_many :appearances
  has_many :recruits, through: :appearances
  has_many :athlete_events
  has_many :athletes, through: :athlete_events
end

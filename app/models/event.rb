class Event < ApplicationRecord
  has_many :calendar_events
  has_many :calendars, through: :calendar_events
  has_many :appearances
  has_many :recruits, through: :appearances
  has_many :athlete_events
  has_many :athletes, through: :athlete_events
end

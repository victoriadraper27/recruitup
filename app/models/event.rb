class Event < ApplicationRecord
  has_many :calendar_events
  has_many :calendars, through: :calendar_events
  has_many :appearences
  has_many :recruits, through: :appearences
  has_many :athlete_events
  has_many :athletes, through: :athlete_events
end

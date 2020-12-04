class Event < ApplicationRecord
  has_many :schedule_events
  has_many :schedules, through: :schedule_events
  has_one :appearance
  has_many :recruits, through: :appearance
  has_many :athlete_events
  has_many :athletes, through: :athlete_events
  has_many :notes, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

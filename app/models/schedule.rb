class Schedule < ApplicationRecord
  belongs_to :team
  has_many :schedule_events
  has_many :events, through: :schedule_events
end

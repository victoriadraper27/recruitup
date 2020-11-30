class Calendar < ApplicationRecord
  belongs_to :user
  has_many :calendar_events
  has_many :events, through: :calendar_events
end

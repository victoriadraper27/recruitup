class ScheduleEvent < ApplicationRecord
  belongs_to :event
  belongs_to :schedule
  belongs_to :user, optional: true
  has_many :notes, through: :event
end

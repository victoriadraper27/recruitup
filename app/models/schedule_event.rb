class ScheduleEvent < ApplicationRecord
  belongs_to :event
  belongs_to :schedule
  belongs_to :user, optional: true
end

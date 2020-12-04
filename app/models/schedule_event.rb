class ScheduleEvent < ApplicationRecord
  belongs_to :event
  belongs_to :schedule
  belongs_to :user, optional: true

  # validates :user, inclusion: { in: TEAM_MEMBERS, allow_blank: true }
end

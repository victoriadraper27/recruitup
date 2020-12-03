class ScheduleEvent < ApplicationRecord
  TEAM_MEMBERS = current_user.team.users

  belongs_to :event
  belongs_to :schedule
  belongs_to :user, optional: true
end

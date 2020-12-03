class Team < ApplicationRecord
  belongs_to :organization
  belongs_to :sport
  belongs_to :selected_schedule, class_name: 'Schedule', foreign_key: :selected_schedule_id, optional: true

  has_many :recruits, dependent: :destroy
  has_many :users
  has_many :schedules
end

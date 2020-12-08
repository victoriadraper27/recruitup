class Athlete < ApplicationRecord
  has_many :athlete_events
  has_many :events, through: :athlete_events
  has_many :recruits
  has_many :teams, through: :recruits
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search,
    against: [:first_name, :last_name, :grad_year, :rating, :athlete_team, :nationality],
    using: {
      tsearch: { prefix: true }
    }
end

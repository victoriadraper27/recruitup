class Athlete < ApplicationRecord
  has_many :athlete_events
  has_many :events, through: :athlete_events
  has_many :recruits
  has_many :users, through: :recruits

  include PgSearch::Model
  pg_search_scope :search,
    against: [:first_name, :last_name, :grad_year, :rating, :team, :nationality],
    using: {
      tsearch: { prefix: true }
    }
end

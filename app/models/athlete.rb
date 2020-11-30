class Athlete < ApplicationRecord
  has_many :athlete_events
  has_many :events, through: :athlete_events
  has_many :recruits
  has_many :coaches, through: :recruits

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:first_name, :last_name, :grad_year, :rating, :team, :nationality],
    associated_against: {
      event: [:location, :date]
    },
    using: {
      tsearch: { prefix: true }
    }
end

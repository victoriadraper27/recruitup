class Recruit < ApplicationRecord
  belongs_to :athlete
  belongs_to :user

  # include PgSearch::Model
  # pg_search_scope :search,
  #   against: [:first_name, :last_name, :grad_year, :rating, :team, :nationality],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end

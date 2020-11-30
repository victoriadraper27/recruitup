class Recruit < ApplicationRecord
  belongs_to :athlete
  belongs_to :user
end

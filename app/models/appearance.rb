class Appearance < ApplicationRecord
  belongs_to :event
  belongs_to :recruit
  has_many :notes
end

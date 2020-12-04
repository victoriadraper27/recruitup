class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sport
  belongs_to :organization
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team
  has_many :schedule_events
  has_many :unavailable_days
  has_many :notes
  has_one_attached :photo
end

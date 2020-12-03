class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization
  belongs_to :sport
  belongs_to :selected_schedule, class_name: 'Schedule', foreign_key: :selected_schedule_id, optional: true

  has_many :recruits, dependent: :destroy
  has_many :schedules
end

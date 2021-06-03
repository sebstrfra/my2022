class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_users
  has_many :users, through: :challenge_users
  has_many :goals
  has_many :user_goals, through: :goals

  validates :name, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
end

class Challenge < ApplicationRecord
  belongs_to :user
  has_many :users, through: :challenge_users
  has_many :challenge_users
  has_many :goals
  has_many :user_goals, through: :goals
end

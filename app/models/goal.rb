class Goal < ApplicationRecord
  belongs_to :challenge
  has_many :user_goals
  has_many :steps, through: :user_goals
  has_many :users, through: :user_goals
end

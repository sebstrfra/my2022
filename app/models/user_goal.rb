class UserGoal < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :steps

  scope :user_amount_of_day, ->(goal, user) { where(user: user, goal: goal)[0].current_amount }


end

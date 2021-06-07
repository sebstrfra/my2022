class UserGoal < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :steps

  # finds ACTUAL amount for specific user and specific goal
  # scope :user_amount_of_day, ->(goal, user) { where(user: user, goal: goal)[0].current_amount }

  def delta_to_target
    self.current_amount - self.goal.goal_for_the_day
  end

  def delta_to_team_average
    self.current_amount - self.goal.team_average
  end

end

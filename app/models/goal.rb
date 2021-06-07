class Goal < ApplicationRecord
  belongs_to :challenge
  has_many :user_goals
  has_many :steps, through: :user_goals
  has_many :users, through: :user_goals

  validates :name, presence: true
  validates :target_amount, presence: true
  validates :unit, presence: true
  # validates :goal_type, presence: true

  enum goal_type: [:min_amount, :max_amount]

  def team_average
    all_amounts = self.user_goals.map{|x| x[:current_amount]}
    team_average = all_amounts.inject(&:+).to_f / all_amounts.size
    return team_average
  end

  def min_max_nice
    self.goal_type == "min_amount" ? "min" : "max"
  end

  def amount_per_day
    (self.target_amount.to_f / self.challenge.challenge_duration.to_f)
  end

  def goal_for_the_day
    self.amount_per_day * self.challenge.day_of_challenge
  end








end

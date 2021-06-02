class Goal < ApplicationRecord
  belongs_to :challenge
  has_many :user_goals
  has_many :steps, through: :user_goals
  has_many :users, through: :user_goals

  validates :name, presence: true
  validates :target_amount, presence: true
  validates :unit, presence: true
  validates :goal_type, presence: true

  enum goal_type: [:min_amount, :max_amount]
end

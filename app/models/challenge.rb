class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_users
  has_many :users, through: :challenge_users
  has_many :goals
  has_many :user_goals, through: :goals

  validates :name, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true

  def day_of_challenge
    (Date.today - self.start_date).to_i
  end

  def challenge_duration
    (self.end_date - self.start_date).to_i
  end

end

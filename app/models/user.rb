class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_goals
  has_many :challenge_users
  has_many :challenges, through: :challenge_users
  has_many :goals, through: :user_goals
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end

end

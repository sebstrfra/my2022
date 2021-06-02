class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  enum status: [:pending, :accepted, :declined]
end

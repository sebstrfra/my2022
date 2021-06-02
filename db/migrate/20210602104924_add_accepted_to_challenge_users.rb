class AddAcceptedToChallengeUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :challenge_users, :accepted, :boolean, default: false
  end
end

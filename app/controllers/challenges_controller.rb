class ChallengesController < ApplicationController

  def index
    @challenge_users = ChallengeUser.where(user: current_user)
  end
end

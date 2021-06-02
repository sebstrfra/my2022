require 'date'

class ChallengesController < ApplicationController

  def index
    @challenge_users = ChallengeUser.where(user: current_user)
  end

  def show
    @challenge = Challenge.find(params[:id])
    @users = @challenge.users
    @goals = @challenge.goals

    @challenge_duration = (@challenge.end_date - @challenge.start_date).to_i
    @challenge_day = (Date.today - @challenge.start_date).to_i
    @days_left = (@challenge.end_date - Date.today).to_i

    # @user_goals =
  end

  private




end

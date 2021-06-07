require 'date'
class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    if @challenge.save
      redirect_to new_challenge_goal_path(@challenge)
    else
      render :new
    end
  end

  def index
    @challenge_users = ChallengeUser.where(user: current_user)
  end

  def show
    @challenge = Challenge.find(params[:id])
    @users = @challenge.users
    @goals = @challenge.goals
  end

  private
  def challenge_params
    params.require(:challenge). permit(:name, :start_date, :end_date)
  end

end


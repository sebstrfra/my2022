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
end

private
def challenge_params
  params.require(:challenge). permit(:name, :start_date, :end_date)
end




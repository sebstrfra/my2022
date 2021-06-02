class ChallengeUsersController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_users = @challenge.challenge_users
    @challenge_user = ChallengeUser.new
  end


  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_user = ChallengeUser.new(challenge_user_params)
    @challenge_user.challenge = @challenge
    if @challenge_user.save
      redirect_to new_challenge_challenge_user_path(@challenge)
    else
      render :new
    end
  end


  private
  def challenge_user_params
    params.require(:challenge_user).permit(:user_id)
  end
end


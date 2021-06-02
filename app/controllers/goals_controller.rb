class GoalsController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @goals = @challenge.goals
    @goal = Goal.new
  end


  def create
    @challenge = Challenge.find(params[:challenge_id])
    @goal = Goal.new(goal_params)
    @goal.challenge = @challenge
    if @goal.save
      redirect_to new_challenge_goal_path(@challenge)
    else
      render :new
    end
  end


  private
  def goal_params
    params.require(:goal).permit(:name, :target_amount, :unit)
  end
end

class GoalsController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @goals = @challenge.goals
    @goal = Goal.new
  end


  def create
    @challenge = Challenge.find(params[:challenge_id])
    @goals = @challenge.goals
    @goal = Goal.new(goal_params)
    @goal.challenge = @challenge
    if @goal.save
      # UserGoal.create(user: user, goal: goal, current_amount: amount)
      @challenge.users.each do |user|
        UserGoal.find_or_create_by(goal: @goal, user: user)
        
      end
      redirect_to challenge_path(@challenge)
    else
      render :new
    end
  end


  private
  def goal_params
    params.require(:goal).permit(:name, :target_amount, :unit)
  end
end

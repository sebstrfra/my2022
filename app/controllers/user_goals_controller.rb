class UserGoalsController < ApplicationController

 def plus_one
  @user_goal = UserGoal.find(params[:user_goal_id])
  @user_goal.current_amount += 1
  @user_goal.save!
  @challenge = @user_goal.goal.challenge
  redirect_to @challenge
 end


end

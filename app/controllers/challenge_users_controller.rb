class ChallengeUsersController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_users = @challenge.challenge_users
    @challenge_user = ChallengeUser.new
    @friendships_unsorted = Friendship.where(asker_id: current_user.id) + Friendship.where(receiver_id: current_user.id)
    @friendships = @friendships_unsorted.select { |friendship| friendship.accepted? }
    @friends_unsorted = []
    @friendships.each do |friendship|
      @friends_unsorted << User.find(friendship.asker_id)
      @friends_unsorted << User.find(friendship.receiver_id)
    end
    @friends = @friends_unsorted.uniq.reject { |friend| friend.id == current_user.id }
  end


  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_users = @challenge.challenge_users
    @challenge_users_names = @challenge_users.map {|user| user.user.first_name}
    @challenge_user = ChallengeUser.new(challenge_user_params)
    @challenge_user.challenge = @challenge
    if @challenge_user.save && !@challenge_users_names.include?(@challenge_user.user.first_name)
      @challenge.goals.each do |goal|
        UserGoal.create(user_id: @challenge_user.user_id, goal_id: goal.id, current_amount: 0)
      end
      redirect_to new_challenge_challenge_user_path(@challenge)
    end
  end


  private
  def challenge_user_params
    params.require(:challenge_user).permit(:user_id)
  end
end


class UsersController < ApplicationController

  def index
    @friendships = Friendship.where("asker_id = ? or receiver_id = ?", current_user.id, current_user.id)
    @friends = []
    @friendships.each do |friendship|
      if friendship.receiver_id == current_user.id
        @friends << friendship.asker
      else
        @friends << friendship.receiver
      end
    end
    if params[:query].present?
      @users = User.where("first_name ILIKE ?", "%#{params[:query]}%")
    else
      @users = []
    end
    @users -= @friends
  end

end

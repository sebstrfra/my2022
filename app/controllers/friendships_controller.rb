class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.where("asker_id = ? or receiver_id = ?", current_user.id, current_user.id)
    @friends = []
    @friends_pending = []
    @friendships.each do |friendship|
      if friendship.status != "pending"
        if friendship.receiver_id == current_user.id
          @friends << friendship.asker
        else
          @friends << friendship.receiver
        end
      else
        if friendship.receiver_id == current_user.id
          @friends_pending << friendship.asker
        else
          @friends_pending << friendship.receiver
        end
      end
    end


  end

  def create
    friendship = Friendship.new
    friendship.asker = current_user
    user = User.find(params[:id])
    friendship.receiver = user
    friendship.status = 0
    friendship.save!
    redirect_to friendships_path
  end

  def update
    @friendships = Friendship.where("asker_id = ? and receiver_id = ? or asker_id = ? and receiver_id = ?", current_user.id, params[:id], params[:id], current_user.id)
    @friendships.each do |friendship|
      friendship.update(:status => 2)
    end
    redirect_to friendships_path
  end

  def destroy
    @friendships = Friendship.where("asker_id = ? and receiver_id = ? or asker_id = ? and receiver_id = ?", current_user.id, params[:id], params[:id], current_user.id)
    @friendships.each do |friendship|
      friendship.destroy
    end

    redirect_to friendships_path
  end

end

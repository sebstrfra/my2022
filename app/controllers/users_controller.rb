class UsersController < ApplicationController
  
  def index
    if params[:query].present?
      @users = User.where("first_name ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

end

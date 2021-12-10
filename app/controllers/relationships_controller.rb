class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # before_action :guest_user?

  def create
    if user_signed_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end

  def index
    if params[:follow]
      @users = current_user.following
    elsif params[:followed]
      @users = current_user.followers
    else
      redirect_to top_path
    end
  end
end

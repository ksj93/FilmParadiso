class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users =User.all
  end
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find(current_user.id)
    end
  end

end

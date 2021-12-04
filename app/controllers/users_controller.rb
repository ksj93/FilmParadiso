class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users =User.all
  end
  def show

    if params[:id]
      @movie_evaluations = MovieEvaluation.where(user_id:params[:id]).limit(3)
      @user = User.find(params[:id])
    else
      @movie_evaluations = MovieEvaluation.where(user_id:current_user.id).limit(3)
      @user = User.find(current_user.id)
    end
  end

end

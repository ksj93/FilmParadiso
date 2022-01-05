class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only:[:index,:search]

  def index
    @users =@q.result.page(params[:page]).per(10)
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

  def search
    @results = @q.result
  end

  private
  def set_q
    @q = User.ransack(params[:q])
  end

end

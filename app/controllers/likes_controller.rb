class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    like = current_user.likes.create(movie_evaluation_id:params[:movie_evaluation_id])
    redirect_to movie_evaluation_path(params[:movie_evaluation_id])
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to movie_evaluation_path(like.movie_evaluation_id)
  end

end

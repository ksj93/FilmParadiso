class MovieEvaluationsController < ApplicationController
  before_action :set_movie_evaluation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :current_user?,only:[:edit,:destroy]
  # before_action :guest_user?, only: [:new,:edit,:destroy]

  # GET /movie_evaluations or /movie_evaluations.json
  def index
    @movie_evaluations = MovieEvaluation.where(user_id:current_user.id).order(created_at:"DESC").limit(3)
    @movie_evaluations_order_create = MovieEvaluation.order(created_at:"DESC").limit(3)
    @movie_evaluations_order_likes = MovieEvaluation.includes(:like_users).sort{|a,b| b.like_users.size <=> a.like_users.size}[0..2]
  end

  def index_full
    if params[:popular]
      @movie_evaluations = MovieEvaluation.includes(:like_users).sort{|a,b| b.like_users.size <=> a.like_users.size}
    elsif params[:fresh]
      @movie_evaluations = MovieEvaluation.order(created_at:"DESC")
    elsif params[:movie_id]
      @movie_evaluations = MovieEvaluation.where(movie_id:params[:movie_id])
    elsif params[:id]
      @user = User.find(params[:id])
      @movie_evaluations = MovieEvaluation.where(user_id:params[:id])
    else
      @movie_evaluations = MovieEvaluation.where(user_id:current_user.id)
    end
  end

  # GET /movie_evaluations/1 or /movie_evaluations/1.json
  def show
    @like = current_user.likes.find_by(movie_evaluation_id:@movie_evaluation.id)
  end

  # GET /movie_evaluations/new
  def new
    @movie_evaluation = MovieEvaluation.new
  end

  # GET /movie_evaluations/1/edit
  def edit
  end

  # POST /movie_evaluations or /movie_evaluations.json
  def create
    @movie_evaluation = MovieEvaluation.new(movie_evaluation_params)
    @movie_evaluation.user_id = current_user.id
    respond_to do |format|
      if @movie_evaluation.save
        format.html { redirect_to @movie_evaluation, notice: "映画の評価を投稿できました！" }
        format.json { render :show, status: :created, location: @movie_evaluation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_evaluations/1 or /movie_evaluations/1.json
  def update
    respond_to do |format|
      if @movie_evaluation.update(movie_evaluation_params)
        format.html { redirect_to @movie_evaluation, notice: "映画の評価を更新できました！" }
        format.json { render :show, status: :ok, location: @movie_evaluation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_evaluations/1 or /movie_evaluations/1.json
  def destroy
    @movie_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to movie_evaluations_url, notice: "映画の評価を削除できました！" }
      format.json { head :no_content }
    end
  end

  def search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_evaluation
      @movie_evaluation = MovieEvaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_evaluation_params
      params.require(:movie_evaluation).permit(:short_criticism, :score, :movie_id)
    end

    def current_user?
      @movie_evaluation = MovieEvaluation.find(params[:id])
      if current_user.admin == true || @movie_evaluation.user_id == current_user.id

      elsif @movie_evaluation.user_id != current_user.id
        redirect_to movie_evaluation_path(@movie_evaluation)
      end
    end
end

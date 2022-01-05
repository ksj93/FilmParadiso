class MovieEvaluationsController < ApplicationController
  before_action :set_movie_evaluation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :current_user?,only:[:edit,:destroy]
  before_action :set_q, only:[:index,:search]
  # before_action :guest_user?, only: [:new,:edit,:destroy]

  # GET /movie_evaluations or /movie_evaluations.json
  def index
    if params[:popular]
      sort_evaluation = MovieEvaluation.includes(:like_users).sort{|a,b| b.like_users.size <=> a.like_users.size}
      @movie_evaluations = Kaminari.paginate_array(sort_evaluation).page(params[:page]).per(10)
    else
      @movie_evaluations = @q.result.order(created_at:"DESC").page(params[:page]).per(10)
    end

    @movie_evaluation = MovieEvaluation.new
    if params[:commit]=="登録する"
      if params[:movie_evaluation][:score].present? && params[:movie_evaluation][:short_criticism].present?
        @movie_evaluation = MovieEvaluation.new(movie_id:params[:movie_evaluation][:movie_id],score:params[:movie_evaluation][:score],short_criticism:params[:movie_evaluation][:short_criticism])
        @movie_evaluation.user_id = current_user.id
        if @movie_evaluation.save
          redirect_to movie_evaluations_path,notice:"投稿しました！"
        else
          redirect_to movie_evaluations_path,notice:"不備の情報があります！"
        end
      else
        redirect_to movie_evaluations_path,notice:"不備の情報があります！"
      end
    end
  end

  # def index_new
  #
  # end
  #
  # def index_create
  #
  # end

  def search
    @results = @q.result
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
        # test code
        # format.html { redirect_to new_movie_evaluation_path(movie_id:@movie_evaluation.movie_id,select_movie:'true'), status: :unprocessable_entity}
        # format.json { render json: @movie_evaluation.errors, status: :unprocessable_entity }
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

  private
    def set_q
      @q = MovieEvaluation.ransack(params[:q])
    end
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

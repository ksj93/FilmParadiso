class MovieEvaluationsController < ApplicationController
  before_action :set_movie_evaluation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /movie_evaluations or /movie_evaluations.json
  def index
    @movie_evaluations = MovieEvaluation.all
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
        format.html { redirect_to @movie_evaluation, notice: "Movie evaluation was successfully created." }
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
        format.html { redirect_to @movie_evaluation, notice: "Movie evaluation was successfully updated." }
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
      format.html { redirect_to movie_evaluations_url, notice: "Movie evaluation was successfully destroyed." }
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
end

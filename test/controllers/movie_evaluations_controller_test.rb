require 'test_helper'

class MovieEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_evaluation = movie_evaluations(:one)
  end

  test "should get index" do
    get movie_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_evaluation_url
    assert_response :success
  end

  test "should create movie_evaluation" do
    assert_difference('MovieEvaluation.count') do
      post movie_evaluations_url, params: { movie_evaluation: { movie_id: @movie_evaluation.movie_id, score: @movie_evaluation.score, short_criticism: @movie_evaluation.short_criticism } }
    end

    assert_redirected_to movie_evaluation_url(MovieEvaluation.last)
  end

  test "should show movie_evaluation" do
    get movie_evaluation_url(@movie_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_evaluation_url(@movie_evaluation)
    assert_response :success
  end

  test "should update movie_evaluation" do
    patch movie_evaluation_url(@movie_evaluation), params: { movie_evaluation: { movie_id: @movie_evaluation.movie_id, score: @movie_evaluation.score, short_criticism: @movie_evaluation.short_criticism } }
    assert_redirected_to movie_evaluation_url(@movie_evaluation)
  end

  test "should destroy movie_evaluation" do
    assert_difference('MovieEvaluation.count', -1) do
      delete movie_evaluation_url(@movie_evaluation)
    end

    assert_redirected_to movie_evaluations_url
  end
end

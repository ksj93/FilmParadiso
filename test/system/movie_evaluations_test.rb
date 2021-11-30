require "application_system_test_case"

class MovieEvaluationsTest < ApplicationSystemTestCase
  setup do
    @movie_evaluation = movie_evaluations(:one)
  end

  test "visiting the index" do
    visit movie_evaluations_url
    assert_selector "h1", text: "Movie Evaluations"
  end

  test "creating a Movie evaluation" do
    visit movie_evaluations_url
    click_on "New Movie Evaluation"

    fill_in "Movie", with: @movie_evaluation.movie_id
    fill_in "Score", with: @movie_evaluation.score
    fill_in "Short criticism", with: @movie_evaluation.short_criticism
    click_on "Create Movie evaluation"

    assert_text "Movie evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Movie evaluation" do
    visit movie_evaluations_url
    click_on "Edit", match: :first

    fill_in "Movie", with: @movie_evaluation.movie_id
    fill_in "Score", with: @movie_evaluation.score
    fill_in "Short criticism", with: @movie_evaluation.short_criticism
    click_on "Update Movie evaluation"

    assert_text "Movie evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie evaluation" do
    visit movie_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie evaluation was successfully destroyed"
  end
end

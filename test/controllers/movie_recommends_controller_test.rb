require 'test_helper'

class MovieRecommendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movie_recommends_index_url
    assert_response :success
  end

end

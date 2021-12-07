require 'test_helper'

class FavoriteGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favorite_genres_new_url
    assert_response :success
  end

end

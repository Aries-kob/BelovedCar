require "test_helper"

class Menbers::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get menbers_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get menbers_favorites_destroy_url
    assert_response :success
  end
end

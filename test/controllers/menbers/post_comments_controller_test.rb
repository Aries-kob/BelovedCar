require "test_helper"

class Menbers::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get menbers_post_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get menbers_post_comments_destroy_url
    assert_response :success
  end
end

require "test_helper"

class Menbers::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get menbers_rooms_new_url
    assert_response :success
  end

  test "should get create" do
    get menbers_rooms_create_url
    assert_response :success
  end

  test "should get index" do
    get menbers_rooms_index_url
    assert_response :success
  end

  test "should get show" do
    get menbers_rooms_show_url
    assert_response :success
  end

  test "should get edit" do
    get menbers_rooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get menbers_rooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get menbers_rooms_destroy_url
    assert_response :success
  end
end

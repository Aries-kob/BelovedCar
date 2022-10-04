require "test_helper"

class Menbers::CarControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get menbers_car_new_url
    assert_response :success
  end

  test "should get index" do
    get menbers_car_index_url
    assert_response :success
  end

  test "should get show" do
    get menbers_car_show_url
    assert_response :success
  end

  test "should get edit" do
    get menbers_car_edit_url
    assert_response :success
  end

  test "should get update" do
    get menbers_car_update_url
    assert_response :success
  end

  test "should get destroy" do
    get menbers_car_destroy_url
    assert_response :success
  end
end

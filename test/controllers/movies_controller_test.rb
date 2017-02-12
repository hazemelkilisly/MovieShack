require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get featured" do
    get :featured
    assert_response :success
  end

  test "should get recent" do
    get :recent
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get add_to_watchlist" do
    get :add_to_watchlist
    assert_response :success
  end

  test "should get remove_from_watchlist" do
    get :remove_from_watchlist
    assert_response :success
  end

  test "should get review" do
    get :review
    assert_response :success
  end

  test "should get fb_share" do
    get :fb_share
    assert_response :success
  end

end

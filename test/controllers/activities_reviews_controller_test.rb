require 'test_helper'

class ActivitiesReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activities_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get activities_reviews_show_url
    assert_response :success
  end

  test "should get create" do
    get activities_reviews_create_url
    assert_response :success
  end

  test "should get new" do
    get activities_reviews_new_url
    assert_response :success
  end

  test "should get destroy" do
    get activities_reviews_destroy_url
    assert_response :success
  end

end

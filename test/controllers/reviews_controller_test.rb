require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @review = reviews(:review1)
    reviewer = users(:user1)

    sign_in reviewer
    @access_token = auth_tokens_for_user(reviewer)
  end

  test "should get index" do
    get api_v1_reviews_url, headers: @access_token
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post api_v1_reviews_url, params: { review: { movie_id: @review.movie_id, rating: @review.rating, text: @review.text } }, headers: @access_token
    end

    assert_response 201
  end

  test "should show review" do
    get api_v1_review_url(@review), headers: @access_token
    assert_response :success
  end

  test "should update review" do
    patch api_v1_review_url(@review), params: { review: { movie_id: @review.movie_id, rating: @review.rating, text: @review.text, user_id: @review.user_id } }, headers: @access_token
    assert_response 200
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete api_v1_review_url(@review), headers: @access_token
    end

    assert_response 204
  end
end

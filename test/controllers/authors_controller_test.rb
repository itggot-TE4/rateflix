require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author1)
  end

  test "should get index" do
    get api_v1_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post api_v1_authors_url, params: { author: { name: @author.name } }
    end

    assert_redirected_to api_v1_author_url(Author.last)
  end

  test "should show author" do
    get api_v1_author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    patch api_v1_author_url(@author), params: { author: { name: @author.name } }
    assert_redirected_to api_v1_author_url(@author)
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete api_v1_author_url(@author)
    end

    assert_redirected_to api_v1_authors_url
  end
end

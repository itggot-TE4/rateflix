require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:movie1)
  end

  test "should get index" do
    get api_v1_movies_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post api_v1_movies_url, params: { movie: { title: "test_#{@movie.title}", author_id: @movie.author_id } }
    end

    assert_response 201
  end

  test "should show movie" do
    get api_v1_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch api_v1_movie_url(@movie), params: { movie: { title: @movie.title, author_id: @movie.author_id } }
    assert_response 200
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete api_v1_movie_url(@movie)
    end

    assert_response 204
  end
end

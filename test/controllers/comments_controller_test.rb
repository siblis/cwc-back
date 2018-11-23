require 'test_helper'
require_relative '../../app/controllers/api/v1/comments_controller'
CommentsController = Api::V1::CommentsController

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    puts comments_url
    get comments_url, as: :json
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { body: @comment.body, task_id: @comment.task_id  }, as: :json
    end

     assert_response 201
  end

  test "should show comment" do
    get comment_url(@comment), as: :json
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { body: @comment.body, task_id: @comment.task_id }, as: :json
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment), as: :json
    end

    assert_response 204
  end
end

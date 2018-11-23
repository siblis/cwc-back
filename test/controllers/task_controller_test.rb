require 'test_helper'
require_relative '../../app/controllers/api/v1/tasks_controller'
TasksController = Api::V1::ProjectsController
class TaskControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  def tasks_url task = nil
    url = 'http://www.example.com/api/v1/tasks/'
    if task
       url +=  task.id.to_s+'/'
    end
    return url
  end

  test "should get index" do
    get tasks_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
       post tasks_url, params: { title:@task.title, body: @task.body, project_id: @task.project_id}, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get tasks_url(@task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch tasks_url(@task), params: { body: @task.body}, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete tasks_url(@task), as: :json
    end

    assert_response 200
   end
end

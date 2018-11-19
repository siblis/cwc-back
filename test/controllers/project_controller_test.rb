require 'test_helper'
require_relative '../../app/controllers/api/v1/projects_controller'
ProjectsController = Api::V1::ProjectsController


class ProjectssControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  def  projects_url project = nil
    url = 'http://www.example.com/api/v1/projects'
    if project
      url += '/' + project.id.to_s
    end
    return url
  end

  test "should get index" do
    get projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { title:'test', body: @project.body}, as: :json
    end

    assert_response 201
  end

  test "should show project" do
    get projects_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch projects_url(@project), params: { body: @project.body}, as: :json
    assert_response 200
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete projects_url(@project), as: :json
    end

    assert_response 200
  end
end

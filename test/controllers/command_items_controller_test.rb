require 'test_helper'

class CommandItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command_item = command_items(:one)
  end

  test "should get index" do
    get command_items_url, as: :json
    assert_response :success
  end

  test "should create command_item" do
    assert_difference('CommandItem.count') do
      post command_items_url, params: { command_item: { project_id: @command_item.project_id, user_id: @command_item.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show command_item" do
    get command_item_url(@command_item), as: :json
    assert_response :success
  end

  test "should update command_item" do
    patch command_item_url(@command_item), params: { command_item: { project_id: @command_item.project_id, user_id: @command_item.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy command_item" do
    assert_difference('CommandItem.count', -1) do
      delete command_item_url(@command_item), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @tag = tags(:one)
  end

  test "should get index" do
    get :index, params: { project_id: @project }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { project_id: @project }
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, params: { project_id: @project, tag: @tag.attributes }
    end

    assert_redirected_to project_tag_path(@project, Tag.last)
  end

  test "should show tag" do
    get :show, params: { project_id: @project, id: @tag }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { project_id: @project, id: @tag }
    assert_response :success
  end

  test "should update tag" do
    put :update, params: { project_id: @project, id: @tag, tag: @tag.attributes }
    assert_redirected_to project_tag_path(@project, Tag.last)
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, params: { project_id: @project, id: @tag }
    end

    assert_redirected_to project_tags_path(@project)
  end
end

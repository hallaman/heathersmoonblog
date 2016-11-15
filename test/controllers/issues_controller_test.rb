require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: { friday_id: @issue.friday_id, issue_number: @issue.issue_number, main_image: @issue.main_image, monday_id: @issue.monday_id, moon_phase: @issue.moon_phase, saturday_id: @issue.saturday_id, sidebar_id: @issue.sidebar_id, sunday_id: @issue.sunday_id, thursday_id: @issue.thursday_id, tuesday_id: @issue.tuesday_id, wednesday_id: @issue.wednesday_id, week: @issue.week, welcome: @issue.welcome }
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { friday_id: @issue.friday_id, issue_number: @issue.issue_number, main_image: @issue.main_image, monday_id: @issue.monday_id, moon_phase: @issue.moon_phase, saturday_id: @issue.saturday_id, sidebar_id: @issue.sidebar_id, sunday_id: @issue.sunday_id, thursday_id: @issue.thursday_id, tuesday_id: @issue.tuesday_id, wednesday_id: @issue.wednesday_id, week: @issue.week, welcome: @issue.welcome }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end

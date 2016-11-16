require 'test_helper'

class MondaysControllerTest < ActionController::TestCase
  setup do
    @monday = mondays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mondays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monday" do
    assert_difference('Monday.count') do
      post :create, monday: { affirmation: @monday.affirmation, date: @monday.date, entry: @monday.entry, issue_id: @monday.issue_id, moon_sign: @monday.moon_sign, number_1: @monday.number_1, number_2: @monday.number_2, number_3: @monday.number_3, theme: @monday.theme }
    end

    assert_redirected_to monday_path(assigns(:monday))
  end

  test "should show monday" do
    get :show, id: @monday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monday
    assert_response :success
  end

  test "should update monday" do
    patch :update, id: @monday, monday: { affirmation: @monday.affirmation, date: @monday.date, entry: @monday.entry, issue_id: @monday.issue_id, moon_sign: @monday.moon_sign, number_1: @monday.number_1, number_2: @monday.number_2, number_3: @monday.number_3, theme: @monday.theme }
    assert_redirected_to monday_path(assigns(:monday))
  end

  test "should destroy monday" do
    assert_difference('Monday.count', -1) do
      delete :destroy, id: @monday
    end

    assert_redirected_to mondays_path
  end
end

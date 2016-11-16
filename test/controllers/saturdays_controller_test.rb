require 'test_helper'

class SaturdaysControllerTest < ActionController::TestCase
  setup do
    @saturday = saturdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saturdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saturday" do
    assert_difference('Saturday.count') do
      post :create, saturday: { affirmation: @saturday.affirmation, date: @saturday.date, entry: @saturday.entry, issue_id: @saturday.issue_id, moon_sign: @saturday.moon_sign, number_1: @saturday.number_1, number_2: @saturday.number_2, number_3: @saturday.number_3, theme: @saturday.theme }
    end

    assert_redirected_to saturday_path(assigns(:saturday))
  end

  test "should show saturday" do
    get :show, id: @saturday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saturday
    assert_response :success
  end

  test "should update saturday" do
    patch :update, id: @saturday, saturday: { affirmation: @saturday.affirmation, date: @saturday.date, entry: @saturday.entry, issue_id: @saturday.issue_id, moon_sign: @saturday.moon_sign, number_1: @saturday.number_1, number_2: @saturday.number_2, number_3: @saturday.number_3, theme: @saturday.theme }
    assert_redirected_to saturday_path(assigns(:saturday))
  end

  test "should destroy saturday" do
    assert_difference('Saturday.count', -1) do
      delete :destroy, id: @saturday
    end

    assert_redirected_to saturdays_path
  end
end

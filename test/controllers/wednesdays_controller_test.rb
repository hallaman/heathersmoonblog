require 'test_helper'

class WednesdaysControllerTest < ActionController::TestCase
  setup do
    @wednesday = wednesdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wednesdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wednesday" do
    assert_difference('Wednesday.count') do
      post :create, wednesday: { affirmation: @wednesday.affirmation, date: @wednesday.date, entry: @wednesday.entry, issue_id: @wednesday.issue_id, moon_sign: @wednesday.moon_sign, number_1: @wednesday.number_1, number_2: @wednesday.number_2, number_3: @wednesday.number_3, theme: @wednesday.theme }
    end

    assert_redirected_to wednesday_path(assigns(:wednesday))
  end

  test "should show wednesday" do
    get :show, id: @wednesday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wednesday
    assert_response :success
  end

  test "should update wednesday" do
    patch :update, id: @wednesday, wednesday: { affirmation: @wednesday.affirmation, date: @wednesday.date, entry: @wednesday.entry, issue_id: @wednesday.issue_id, moon_sign: @wednesday.moon_sign, number_1: @wednesday.number_1, number_2: @wednesday.number_2, number_3: @wednesday.number_3, theme: @wednesday.theme }
    assert_redirected_to wednesday_path(assigns(:wednesday))
  end

  test "should destroy wednesday" do
    assert_difference('Wednesday.count', -1) do
      delete :destroy, id: @wednesday
    end

    assert_redirected_to wednesdays_path
  end
end

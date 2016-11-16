require 'test_helper'

class ThursdaysControllerTest < ActionController::TestCase
  setup do
    @thursday = thursdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thursdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thursday" do
    assert_difference('Thursday.count') do
      post :create, thursday: { affirmation: @thursday.affirmation, date: @thursday.date, entry: @thursday.entry, issue_id: @thursday.issue_id, moon_sign: @thursday.moon_sign, number_1: @thursday.number_1, number_2: @thursday.number_2, number_3: @thursday.number_3, theme: @thursday.theme }
    end

    assert_redirected_to thursday_path(assigns(:thursday))
  end

  test "should show thursday" do
    get :show, id: @thursday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thursday
    assert_response :success
  end

  test "should update thursday" do
    patch :update, id: @thursday, thursday: { affirmation: @thursday.affirmation, date: @thursday.date, entry: @thursday.entry, issue_id: @thursday.issue_id, moon_sign: @thursday.moon_sign, number_1: @thursday.number_1, number_2: @thursday.number_2, number_3: @thursday.number_3, theme: @thursday.theme }
    assert_redirected_to thursday_path(assigns(:thursday))
  end

  test "should destroy thursday" do
    assert_difference('Thursday.count', -1) do
      delete :destroy, id: @thursday
    end

    assert_redirected_to thursdays_path
  end
end

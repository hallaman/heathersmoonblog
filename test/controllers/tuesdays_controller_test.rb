require 'test_helper'

class TuesdaysControllerTest < ActionController::TestCase
  setup do
    @tuesday = tuesdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuesdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuesday" do
    assert_difference('Tuesday.count') do
      post :create, tuesday: { affirmation: @tuesday.affirmation, date: @tuesday.date, entry: @tuesday.entry, issue_id: @tuesday.issue_id, moon_sign: @tuesday.moon_sign, number_1: @tuesday.number_1, number_2: @tuesday.number_2, number_3: @tuesday.number_3, theme: @tuesday.theme }
    end

    assert_redirected_to tuesday_path(assigns(:tuesday))
  end

  test "should show tuesday" do
    get :show, id: @tuesday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tuesday
    assert_response :success
  end

  test "should update tuesday" do
    patch :update, id: @tuesday, tuesday: { affirmation: @tuesday.affirmation, date: @tuesday.date, entry: @tuesday.entry, issue_id: @tuesday.issue_id, moon_sign: @tuesday.moon_sign, number_1: @tuesday.number_1, number_2: @tuesday.number_2, number_3: @tuesday.number_3, theme: @tuesday.theme }
    assert_redirected_to tuesday_path(assigns(:tuesday))
  end

  test "should destroy tuesday" do
    assert_difference('Tuesday.count', -1) do
      delete :destroy, id: @tuesday
    end

    assert_redirected_to tuesdays_path
  end
end

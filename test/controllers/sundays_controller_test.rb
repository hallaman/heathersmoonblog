require 'test_helper'

class SundaysControllerTest < ActionController::TestCase
  setup do
    @sunday = sundays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sundays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sunday" do
    assert_difference('Sunday.count') do
      post :create, sunday: { affirmation: @sunday.affirmation, date: @sunday.date, entry: @sunday.entry, issue_id: @sunday.issue_id, moon_sign: @sunday.moon_sign, number_1: @sunday.number_1, number_2: @sunday.number_2, number_3: @sunday.number_3, theme: @sunday.theme }
    end

    assert_redirected_to sunday_path(assigns(:sunday))
  end

  test "should show sunday" do
    get :show, id: @sunday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sunday
    assert_response :success
  end

  test "should update sunday" do
    patch :update, id: @sunday, sunday: { affirmation: @sunday.affirmation, date: @sunday.date, entry: @sunday.entry, issue_id: @sunday.issue_id, moon_sign: @sunday.moon_sign, number_1: @sunday.number_1, number_2: @sunday.number_2, number_3: @sunday.number_3, theme: @sunday.theme }
    assert_redirected_to sunday_path(assigns(:sunday))
  end

  test "should destroy sunday" do
    assert_difference('Sunday.count', -1) do
      delete :destroy, id: @sunday
    end

    assert_redirected_to sundays_path
  end
end

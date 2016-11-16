require 'test_helper'

class FridaysControllerTest < ActionController::TestCase
  setup do
    @friday = fridays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friday" do
    assert_difference('Friday.count') do
      post :create, friday: { affirmation: @friday.affirmation, date: @friday.date, entry: @friday.entry, issue_id: @friday.issue_id, moon_sign: @friday.moon_sign, number_1: @friday.number_1, number_2: @friday.number_2, number_3: @friday.number_3, theme: @friday.theme }
    end

    assert_redirected_to friday_path(assigns(:friday))
  end

  test "should show friday" do
    get :show, id: @friday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friday
    assert_response :success
  end

  test "should update friday" do
    patch :update, id: @friday, friday: { affirmation: @friday.affirmation, date: @friday.date, entry: @friday.entry, issue_id: @friday.issue_id, moon_sign: @friday.moon_sign, number_1: @friday.number_1, number_2: @friday.number_2, number_3: @friday.number_3, theme: @friday.theme }
    assert_redirected_to friday_path(assigns(:friday))
  end

  test "should destroy friday" do
    assert_difference('Friday.count', -1) do
      delete :destroy, id: @friday
    end

    assert_redirected_to fridays_path
  end
end

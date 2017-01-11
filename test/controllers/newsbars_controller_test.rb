require 'test_helper'

class NewsbarsControllerTest < ActionController::TestCase
  setup do
    @newsbar = newsbars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsbars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsbar" do
    assert_difference('Newsbar.count') do
      post :create, newsbar: { message: @newsbar.message, show: @newsbar.show }
    end

    assert_redirected_to newsbar_path(assigns(:newsbar))
  end

  test "should show newsbar" do
    get :show, id: @newsbar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newsbar
    assert_response :success
  end

  test "should update newsbar" do
    patch :update, id: @newsbar, newsbar: { message: @newsbar.message, show: @newsbar.show }
    assert_redirected_to newsbar_path(assigns(:newsbar))
  end

  test "should destroy newsbar" do
    assert_difference('Newsbar.count', -1) do
      delete :destroy, id: @newsbar
    end

    assert_redirected_to newsbars_path
  end
end

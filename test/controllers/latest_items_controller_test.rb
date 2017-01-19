require 'test_helper'

class LatestItemsControllerTest < ActionController::TestCase
  setup do
    @latest_item = latest_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:latest_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create latest_item" do
    assert_difference('LatestItem.count') do
      post :create, latest_item: { image: @latest_item.image, link: @latest_item.link, show: @latest_item.show, title: @latest_item.title }
    end

    assert_redirected_to latest_item_path(assigns(:latest_item))
  end

  test "should show latest_item" do
    get :show, id: @latest_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @latest_item
    assert_response :success
  end

  test "should update latest_item" do
    patch :update, id: @latest_item, latest_item: { image: @latest_item.image, link: @latest_item.link, show: @latest_item.show, title: @latest_item.title }
    assert_redirected_to latest_item_path(assigns(:latest_item))
  end

  test "should destroy latest_item" do
    assert_difference('LatestItem.count', -1) do
      delete :destroy, id: @latest_item
    end

    assert_redirected_to latest_items_path
  end
end

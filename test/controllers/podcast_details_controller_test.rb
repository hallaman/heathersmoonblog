require 'test_helper'

class PodcastDetailsControllerTest < ActionController::TestCase
  setup do
    @podcast_detail = podcast_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcast_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create podcast_detail" do
    assert_difference('PodcastDetail.count') do
      post :create, podcast_detail: { image: @podcast_detail.image, link: @podcast_detail.link, podcast_id: @podcast_detail.podcast_id, reading: @podcast_detail.reading, title: @podcast_detail.title }
    end

    assert_redirected_to podcast_detail_path(assigns(:podcast_detail))
  end

  test "should show podcast_detail" do
    get :show, id: @podcast_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @podcast_detail
    assert_response :success
  end

  test "should update podcast_detail" do
    patch :update, id: @podcast_detail, podcast_detail: { image: @podcast_detail.image, link: @podcast_detail.link, podcast_id: @podcast_detail.podcast_id, reading: @podcast_detail.reading, title: @podcast_detail.title }
    assert_redirected_to podcast_detail_path(assigns(:podcast_detail))
  end

  test "should destroy podcast_detail" do
    assert_difference('PodcastDetail.count', -1) do
      delete :destroy, id: @podcast_detail
    end

    assert_redirected_to podcast_details_path
  end
end

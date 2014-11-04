require 'test_helper'

class GuestbooksControllerTest < ActionController::TestCase
  setup do
    @guestbook = guestbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guestbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guestbook" do
    assert_difference('Guestbook.count') do
      post :create, guestbook: { message: @guestbook.message, name: @guestbook.name }
    end

    assert_redirected_to guestbook_path(assigns(:guestbook))
  end

  test "should show guestbook" do
    get :show, id: @guestbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guestbook
    assert_response :success
  end

  test "should update guestbook" do
    patch :update, id: @guestbook, guestbook: { message: @guestbook.message, name: @guestbook.name }
    assert_redirected_to guestbook_path(assigns(:guestbook))
  end

  test "should destroy guestbook" do
    assert_difference('Guestbook.count', -1) do
      delete :destroy, id: @guestbook
    end

    assert_redirected_to guestbooks_path
  end
end

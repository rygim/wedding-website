require 'test_helper'

class RsvpControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get confirmation_code:string" do
    get :confirmation_code:string
    assert_response :success
  end

  test "should get can_attend:boolean" do
    get :can_attend:boolean
    assert_response :success
  end

  test "should get num_attending:integer" do
    get :num_attending:integer
    assert_response :success
  end

end

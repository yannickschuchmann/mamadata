require 'test_helper'

class PlaygroundControllerTest < ActionController::TestCase
  test "should get familytest" do
    get :familytest
    assert_response :success
  end

end

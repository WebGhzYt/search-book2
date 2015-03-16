require 'test_helper'

class IssuerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

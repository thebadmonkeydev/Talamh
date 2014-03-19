require 'test_helper'

class PdfServiceControllerTest < ActionController::TestCase
  test "should get convert" do
    get :convert
    assert_response :success
  end

end

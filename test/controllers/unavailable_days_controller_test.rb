require 'test_helper'

class UnavailableDaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get unavailable_days_create_url
    assert_response :success
  end

end

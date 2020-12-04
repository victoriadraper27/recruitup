require 'test_helper'

class ScheduleEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get schedule_events_update_url
    assert_response :success
  end

end

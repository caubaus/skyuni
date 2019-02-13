require 'test_helper'

class LectureControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lecture_show_url
    assert_response :success
  end

end

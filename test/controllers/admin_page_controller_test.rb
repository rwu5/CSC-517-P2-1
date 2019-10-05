require 'test_helper'

class AdminPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show_all_students" do
    get admin_page_show_all_students_url
    assert_response :success
  end

end

require 'test_helper'

class BorrowersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get borrowers_create_url
    assert_response :success
  end

  test "should get show" do
    get borrowers_show_url
    assert_response :success
  end

end

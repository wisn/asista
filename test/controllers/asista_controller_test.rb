require 'test_helper'

class AsistaControllerTest < ActionDispatch::IntegrationTest
  test "should get parse" do
    get asista_parse_url
    assert_response :success
  end

end

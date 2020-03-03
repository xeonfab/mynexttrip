require 'test_helper'

class ClimateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get climate_index_url
    assert_response :success
  end

end

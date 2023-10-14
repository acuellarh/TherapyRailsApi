require "test_helper"

class PacientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pacients_index_url
    assert_response :success
  end
end

require "test_helper"

class ScriptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scripts_index_url
    assert_response :success
  end
end

require "test_helper"

class SwipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get swipes_new_url
    assert_response :success
  end

  test "should get create" do
    get swipes_create_url
    assert_response :success
  end

  test "should get index" do
    get swipes_index_url
    assert_response :success
  end

  test "should get show" do
    get swipes_show_url
    assert_response :success
  end
end

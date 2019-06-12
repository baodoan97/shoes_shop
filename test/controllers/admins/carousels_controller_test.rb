require 'test_helper'

class Admins::CarouselsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_carousels_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_carousels_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_carousels_show_url
    assert_response :success
  end

end

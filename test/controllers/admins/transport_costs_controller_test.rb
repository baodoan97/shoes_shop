require 'test_helper'

class Admins::TransportCostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_transport_costs_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_transport_costs_index_url
    assert_response :success
  end

end

require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create_payment" do
    get payments_create_payment_url
    assert_response :success
  end
end

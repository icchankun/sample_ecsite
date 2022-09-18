require "test_helper"

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get customer_customers_mypage_url
    assert_response :success
  end
end

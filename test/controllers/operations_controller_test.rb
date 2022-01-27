require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
  end

  test "should get index" do
    get operations_url
    assert_response :success
  end

  test "should get new" do
    get new_operation_url
    assert_response :success
  end

  test "should create operation" do
    assert_difference("Operation.count") do
      post operations_url, params: { operation: { annual_gross_income: @operation.annual_gross_income, appraisal_price: @operation.appraisal_price, buying_price: @operation.buying_price, city: @operation.city, email: @operation.email, interest_type: @operation.interest_type, name: @operation.name, requested_money: @operation.requested_money, year_of_birth: @operation.year_of_birth, years_duration: @operation.years_duration } }
    end

    assert_redirected_to operation_url(Operation.last)
  end

  test "should show operation" do
    get operation_url(@operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_operation_url(@operation)
    assert_response :success
  end

  test "should update operation" do
    patch operation_url(@operation), params: { operation: { annual_gross_income: @operation.annual_gross_income, appraisal_price: @operation.appraisal_price, buying_price: @operation.buying_price, city: @operation.city, email: @operation.email, interest_type: @operation.interest_type, name: @operation.name, requested_money: @operation.requested_money, year_of_birth: @operation.year_of_birth, years_duration: @operation.years_duration } }
    assert_redirected_to operation_url(@operation)
  end

  test "should destroy operation" do
    assert_difference("Operation.count", -1) do
      delete operation_url(@operation)
    end

    assert_redirected_to operations_url
  end
end

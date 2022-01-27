require "application_system_test_case"

class OperationsTest < ApplicationSystemTestCase
  setup do
    @operation = operations(:one)
  end

  test "visiting the index" do
    visit operations_url
    assert_selector "h1", text: "Operations"
  end

  test "should create operation" do
    visit operations_url
    click_on "New operation"

    fill_in "Annual gross income", with: @operation.annual_gross_income
    fill_in "Appraisal price", with: @operation.appraisal_price
    fill_in "Buying price", with: @operation.buying_price
    fill_in "City", with: @operation.city
    fill_in "Email", with: @operation.email
    fill_in "Interest type", with: @operation.interest_type
    fill_in "Name", with: @operation.name
    fill_in "Requested money", with: @operation.requested_money
    fill_in "Year of birth", with: @operation.year_of_birth
    fill_in "Years duration", with: @operation.years_duration
    click_on "Create Operation"

    assert_text "Operation was successfully created"
    click_on "Back"
  end

  test "should update Operation" do
    visit operation_url(@operation)
    click_on "Edit this operation", match: :first

    fill_in "Annual gross income", with: @operation.annual_gross_income
    fill_in "Appraisal price", with: @operation.appraisal_price
    fill_in "Buying price", with: @operation.buying_price
    fill_in "City", with: @operation.city
    fill_in "Email", with: @operation.email
    fill_in "Interest type", with: @operation.interest_type
    fill_in "Name", with: @operation.name
    fill_in "Requested money", with: @operation.requested_money
    fill_in "Year of birth", with: @operation.year_of_birth
    fill_in "Years duration", with: @operation.years_duration
    click_on "Update Operation"

    assert_text "Operation was successfully updated"
    click_on "Back"
  end

  test "should destroy Operation" do
    visit operation_url(@operation)
    click_on "Destroy this operation", match: :first

    assert_text "Operation was successfully destroyed"
  end
end

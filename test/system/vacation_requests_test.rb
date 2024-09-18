require "application_system_test_case"

class VacationRequestsTest < ApplicationSystemTestCase
  setup do
    @vacation_request = vacation_requests(:one)
  end

  test "visiting the index" do
    visit vacation_requests_url
    assert_selector "h1", text: "Vacation requests"
  end

  test "should create vacation request" do
    visit vacation_requests_url
    click_on "New vacation request"

    fill_in "Description", with: @vacation_request.description
    fill_in "End date", with: @vacation_request.end_date
    fill_in "Start date", with: @vacation_request.start_date
    fill_in "Status", with: @vacation_request.status
    fill_in "User", with: @vacation_request.user
    click_on "Create Vacation request"

    assert_text "Vacation request was successfully created"
    click_on "Back"
  end

  test "should update Vacation request" do
    visit vacation_request_url(@vacation_request)
    click_on "Edit this vacation request", match: :first

    fill_in "Description", with: @vacation_request.description
    fill_in "End date", with: @vacation_request.end_date.to_s
    fill_in "Start date", with: @vacation_request.start_date.to_s
    fill_in "Status", with: @vacation_request.status
    fill_in "User", with: @vacation_request.user
    click_on "Update Vacation request"

    assert_text "Vacation request was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacation request" do
    visit vacation_request_url(@vacation_request)
    click_on "Destroy this vacation request", match: :first

    assert_text "Vacation request was successfully destroyed"
  end
end

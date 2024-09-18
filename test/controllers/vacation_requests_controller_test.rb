require "test_helper"

class VacationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacation_request = vacation_requests(:one)
  end

  test "should get index" do
    get vacation_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_vacation_request_url
    assert_response :success
  end

  test "should create vacation_request" do
    assert_difference("VacationRequest.count") do
      post vacation_requests_url, params: { vacation_request: { description: @vacation_request.description, end_date: @vacation_request.end_date, start_date: @vacation_request.start_date, status: @vacation_request.status, user: @vacation_request.user } }
    end

    assert_redirected_to vacation_request_url(VacationRequest.last)
  end

  test "should show vacation_request" do
    get vacation_request_url(@vacation_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacation_request_url(@vacation_request)
    assert_response :success
  end

  test "should update vacation_request" do
    patch vacation_request_url(@vacation_request), params: { vacation_request: { description: @vacation_request.description, end_date: @vacation_request.end_date, start_date: @vacation_request.start_date, status: @vacation_request.status, user: @vacation_request.user } }
    assert_redirected_to vacation_request_url(@vacation_request)
  end

  test "should destroy vacation_request" do
    assert_difference("VacationRequest.count", -1) do
      delete vacation_request_url(@vacation_request)
    end

    assert_redirected_to vacation_requests_url
  end
end

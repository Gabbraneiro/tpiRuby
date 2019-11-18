require 'test_helper'

class ReservationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation_detail = reservation_details(:one)
  end

  test "should get index" do
    get reservation_details_url, as: :json
    assert_response :success
  end

  test "should create reservation_detail" do
    assert_difference('ReservationDetail.count') do
      post reservation_details_url, params: { reservation_detail: { quantity: @reservation_detail.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show reservation_detail" do
    get reservation_detail_url(@reservation_detail), as: :json
    assert_response :success
  end

  test "should update reservation_detail" do
    patch reservation_detail_url(@reservation_detail), params: { reservation_detail: { quantity: @reservation_detail.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy reservation_detail" do
    assert_difference('ReservationDetail.count', -1) do
      delete reservation_detail_url(@reservation_detail), as: :json
    end

    assert_response 204
  end
end

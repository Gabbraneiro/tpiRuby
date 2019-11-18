require 'test_helper'

class ItemReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_reservation = item_reservations(:one)
  end

  test "should get index" do
    get item_reservations_url, as: :json
    assert_response :success
  end

  test "should create item_reservation" do
    assert_difference('ItemReservation.count') do
      post item_reservations_url, params: { item_reservation: { date: @item_reservation.date } }, as: :json
    end

    assert_response 201
  end

  test "should show item_reservation" do
    get item_reservation_url(@item_reservation), as: :json
    assert_response :success
  end

  test "should update item_reservation" do
    patch item_reservation_url(@item_reservation), params: { item_reservation: { date: @item_reservation.date } }, as: :json
    assert_response 200
  end

  test "should destroy item_reservation" do
    assert_difference('ItemReservation.count', -1) do
      delete item_reservation_url(@item_reservation), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class SellDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sell_detail = sell_details(:one)
  end

  test "should get index" do
    get sell_details_url, as: :json
    assert_response :success
  end

  test "should create sell_detail" do
    assert_difference('SellDetail.count') do
      post sell_details_url, params: { sell_detail: { quantity: @sell_detail.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show sell_detail" do
    get sell_detail_url(@sell_detail), as: :json
    assert_response :success
  end

  test "should update sell_detail" do
    patch sell_detail_url(@sell_detail), params: { sell_detail: { quantity: @sell_detail.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy sell_detail" do
    assert_difference('SellDetail.count', -1) do
      delete sell_detail_url(@sell_detail), as: :json
    end

    assert_response 204
  end
end

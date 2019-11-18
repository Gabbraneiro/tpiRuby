require 'test_helper'

class ItemSellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_sell = item_sells(:one)
  end

  test "should get index" do
    get item_sells_url, as: :json
    assert_response :success
  end

  test "should create item_sell" do
    assert_difference('ItemSell.count') do
      post item_sells_url, params: { item_sell: { date: @item_sell.date } }, as: :json
    end

    assert_response 201
  end

  test "should show item_sell" do
    get item_sell_url(@item_sell), as: :json
    assert_response :success
  end

  test "should update item_sell" do
    patch item_sell_url(@item_sell), params: { item_sell: { date: @item_sell.date } }, as: :json
    assert_response 200
  end

  test "should destroy item_sell" do
    assert_difference('ItemSell.count', -1) do
      delete item_sell_url(@item_sell), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class VatConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vat_condition = vat_conditions(:one)
  end

  test "should get index" do
    get vat_conditions_url, as: :json
    assert_response :success
  end

  test "should create vat_condition" do
    assert_difference('VatCondition.count') do
      post vat_conditions_url, params: { vat_condition: { description: @vat_condition.description } }, as: :json
    end

    assert_response 201
  end

  test "should show vat_condition" do
    get vat_condition_url(@vat_condition), as: :json
    assert_response :success
  end

  test "should update vat_condition" do
    patch vat_condition_url(@vat_condition), params: { vat_condition: { description: @vat_condition.description } }, as: :json
    assert_response 200
  end

  test "should destroy vat_condition" do
    assert_difference('VatCondition.count', -1) do
      delete vat_condition_url(@vat_condition), as: :json
    end

    assert_response 204
  end
end

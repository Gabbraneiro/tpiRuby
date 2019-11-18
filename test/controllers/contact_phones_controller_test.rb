require 'test_helper'

class ContactPhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_phone = contact_phones(:one)
  end

  test "should get index" do
    get contact_phones_url, as: :json
    assert_response :success
  end

  test "should create contact_phone" do
    assert_difference('ContactPhone.count') do
      post contact_phones_url, params: { contact_phone: { phone: @contact_phone.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show contact_phone" do
    get contact_phone_url(@contact_phone), as: :json
    assert_response :success
  end

  test "should update contact_phone" do
    patch contact_phone_url(@contact_phone), params: { contact_phone: { phone: @contact_phone.phone } }, as: :json
    assert_response 200
  end

  test "should destroy contact_phone" do
    assert_difference('ContactPhone.count', -1) do
      delete contact_phone_url(@contact_phone), as: :json
    end

    assert_response 204
  end
end

class PrivateController < ApplicationController
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    json_response({ error: 'Not Authorized' }, :unauthorized) unless @current_user
  end
end

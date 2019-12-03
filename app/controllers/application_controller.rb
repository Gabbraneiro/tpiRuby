class ApplicationController < ActionController::API

  def respond_with_errors(errors, status)
    render json: ErrorSerializer.serialize(errors), status: status
  end

end

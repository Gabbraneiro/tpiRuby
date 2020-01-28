class ApplicationController < ActionController::API
  before_action :check_request_headers

  include Response

  def request_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  private

  def check_request_headers
    content_type = request.headers["Content-Type"] == 'application/vnd.api+json'
    accept = request.headers["Accept"] == 'application/vnd.api+json'
    if(!content_type or !accept)
        json_response(nil, :unsupported_media_type, errors = {headers: "Debe enviar los headers Content-Type y Accept con el valor 'application/vnd.api+json'"})
    end
  end

end

class ApplicationController < ActionController::API
  # before_action :check_request_headers
  # No encontre la forma de que rails deserialize el request correctamente.
  # Si viene el header Content-Type: application/vnd.api+json no deserializa bien.
  # Por el momento los request se deben hacer con header Content-Type: application/json
  # Aunque el Content-Type sea application/json, la estructura del request debe respetar lo definido por el estandar JSON API. Ya que se usa un adaptador de JSON API para deserializar los request.
  
  include Response

  def request_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  private

  def check_request_headers
    json_response(nil, :unsupported_media_type) unless content_type('application/vnd.api+json')
  end

  def content_type(content_type)
    request.headers["Content-Type"] == content_type
  end

end

module Response
  def json_response(object, status = :ok, errors = {})
    object = ErrorSerializer.serialize(errors) unless errors.empty?
    render json: object, status: status
  end
end

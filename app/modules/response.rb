module Response
  def json_response(object, status = :ok, errors = {})
    object = SerializableError.serialize(errors) unless errors.empty?
    render json: object, status: status
  end
end

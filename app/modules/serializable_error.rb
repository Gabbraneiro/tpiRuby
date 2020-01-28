module SerializableError

  def SerializableError.serialize(errors)
    return if errors.nil?

    json = {}
    new_hash = errors.map do |k, v|
      # v.map do |msg|
        { id: k, title: v }
      # end
    end.flatten
    json[:errors] = new_hash
    json
  end

end

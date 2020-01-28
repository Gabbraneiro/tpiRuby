class SerializableUser < JSONAPI::Serializable::Resource
    type 'users'
    attribute :username
end

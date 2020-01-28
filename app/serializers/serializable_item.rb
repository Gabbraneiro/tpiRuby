class SerializableItem < JSONAPI::Serializable::Resource
    type 'items'
    attributes :status, :price
end

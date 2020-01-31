class SerializableSellDetail < JSONAPI::Serializable::Resource
    type 'sell_details'

    attributes :product, :quantity
end

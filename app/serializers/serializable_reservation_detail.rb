class SerializableReservationDetail < JSONAPI::Serializable::Resource
    type 'reservation_details'

    attribute :product, :quantity
    
end

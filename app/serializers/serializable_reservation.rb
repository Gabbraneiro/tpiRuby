class SerializableReservation < JSONAPI::Serializable::Resource
    type 'reservations'

    attribute :date

    attribute :client_denomination do
        @object.client.denomination
    end

    attribute :total_price do
        @object.reservation_details.collect{ |sd| sd.product.price * sd.quantity}.inject :+
    end

    # has_one :sell do
    #     data do
    #       @object.sell
    #     end
    # end
end

class SerializableReservation < JSONAPI::Serializable::Resource
    type 'reservations'

    has_one :sell do
      data do
        @object.sell
      end
    end

    has_many :reservation_details do
      data do
        @object.reservation_details
      end
    end

    attribute :date

    attribute :client_denomination do
        @object.client.denomination
    end

    attribute :total_price do
        @object.reservation_details.collect{ |sd| sd.product.price * sd.quantity}.inject :+
    end
    
end

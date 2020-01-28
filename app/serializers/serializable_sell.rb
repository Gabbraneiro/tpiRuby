class SerializableSell < JSONAPI::Serializable::Resource
    type 'sells'

    attribute :date

    attribute :client_denomination do
        @object.client.denomination
    end

    attribute :total_price do
        @object.sell_details.collect{ |sd| sd.product.price * sd.quantity}.inject :+
    end

    # belongs_to :reservation
end

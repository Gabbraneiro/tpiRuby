class ReservationSerializer < ActiveModel::Serializer
  attributes :date, :client_denomination, :total_price                                        
end

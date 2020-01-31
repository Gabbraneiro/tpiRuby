class SellReservationRequest
  include ActiveModel::Validations

  attr_reader :reservation

  validate do |sr|
    errors.add(:reservation, "La reserva ya fue vendida") if sr.reservation.sold?
  end

  def initialize(reservation)
    @reservation = reservation
  end
end

class NewReservationRequest < NewMarketableRequest

  validate do |nrr|
    errors_marketable.each do |em|
      errors.add(:reservation_details, em)
    end
  end

  def initialize(hash)
    super(hash)
    @marketable_details = hash[:reservation_details]
  end

end

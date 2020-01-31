class NewSellRequest  < NewMarketableRequest

  validate do |nrr|
    errors_marketable.each do |em|
      errors.add(:sell_details, em)
    end
  end

  def initialize(hash)
    super(hash)
    @marketable_details = hash[:sell_details]
  end

end

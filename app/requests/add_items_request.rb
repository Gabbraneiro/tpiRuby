class AddItemsRequest
  include ActiveModel::Validations

  attr_reader :quantity

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def initialize(hash)
    @quantity = hash[:quantity]
  end

end

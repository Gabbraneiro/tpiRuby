class Item < ApplicationRecord
  enum status: [:disponible, :reservado, :vendido]
  belongs_to :product, foreign_key: "product_id"
  validates :product, presence: true

  def price
    product.price
  end

  def item_reservation

  end

  def item_sell
    
  end
end

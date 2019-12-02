class Product < ApplicationRecord
  validates :code, :description, :detail, :price, presence:true
  validates :code, uniqueness: {:case_sensitive => false}
  validates :code, format: { with: /\A([A-Z]{3}[0-9]{6})\z/, message: "Debe cumplir el formato: 3 letras seguidas de 6 números" }

  def self.in_stock
    self.all.select{ |p| p.items_available.size > 0}
  end

  def self.scarce
    self.all.select{ |p| p.items_available.size.between? 1,5 }
  end

  def items_available
    items.select{ |i| i.disponible? }
  end

  def items
    Item.where(product:self)
  end

end

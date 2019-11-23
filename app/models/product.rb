class Product < ApplicationRecord
  has_many :items, inverse_of: :product
  validates :code, :description, :detail, :amount, presence:true
  validates :code, uniqueness: {:case_sensitive => false}
  # validates :code, format: { with: /[A-Z]{3}[0-9]{6}/, message: "Debe cumplir el formato: 3 letras seguidas de 6 números" }

  def self.in_stock
    self.all.select{ |p| p.items_available > 0}
  end

  def self.scarce
    self.all.select{ |p| p.items_available.between? 1,5 }
  end

  def items_available
    items.select{ |i| i.disponible? }.size
  end
end

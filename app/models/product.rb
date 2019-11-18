class Product < ApplicationRecord
  validates :code, :description, :detail, amount: true
  validates :code, uniqueness: true
  validates :code, format: { with: /[a-z-A-Z]{3}[0-9]{6}/, message: "Debe cumplir el formato: 3 letras seguidas de 6 números" }
end

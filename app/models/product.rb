class Product < ApplicationRecord
  validates :code, :description, :detail, :amount, presence:true
  validates :code, uniqueness: {:case_sensitive => false}
  # validates :code, format: { with: /[A-Z]{3}[0-9]{6}/, message: "Debe cumplir el formato: 3 letras seguidas de 6 números" }
end

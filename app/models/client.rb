class Client < ApplicationRecord
  belongs_to :vat_condition
  has_many :contact_phone, inverse_of: :client

  validates :cuit_cuil, :email, :denomination, presence: true
  validates :cuit_cuil, :email, uniqueness: true
end

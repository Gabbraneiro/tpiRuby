class Client < ApplicationRecord
  belongs_to :vat_condition, foreign_key: "vat_condition_id"
  validates :cuit_cuil, :email, :denomination, presence: true
  validates :cuit_cuil, :email, uniqueness: true
  validates :cuit_cuil, length: {is: 11}
end

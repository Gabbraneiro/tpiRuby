class VatCondition < ApplicationRecord
  validates :description, presence: true
end

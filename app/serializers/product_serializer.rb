class ProductSerializer < ActiveModel::Serializer
  attributes :code, :description, :detail, :price
end

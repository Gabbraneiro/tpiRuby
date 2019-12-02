class InvalidQuantityException < StandardError

  def message(product_id)
    "La cantidad requerida para el producto con id #{product_id} es inválida"
  end

end

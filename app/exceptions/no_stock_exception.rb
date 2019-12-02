class NoStockException < StandardError

  def message(product_id)
    "No hay suficiente stock del producto con id #{product_id}"
  end

end

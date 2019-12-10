module Marketable

  def validate_marketable_params(request_params, type)
    errors = {}
    params = request_params[:reservation_details] if type == 'reservation'
    params = request_params[:sell_details] if type == 'sell'
    validate_products(params, type, errors)
    validate_user(request_params, errors)
    validate_client(request_params, errors)
    validate_date(request_params, errors)
    errors
  end

  def marketable_details_params(request_params, type)
    params = request_params[:reservation_details] if type == 'reservation'
    params = request_params[:sell_details] if type == 'sell'
    params.collect do |rd|
      {product: Product.find(rd[:product_id]), quantity: rd[:quantity]}
    end
  end

  private

  def validate_products(request_params, index, errors)
    request_params.collect do |md|
      messages = []
      begin
        validate_availability(Product.find(md[:product_id]), md[:quantity])
      rescue ActiveRecord::RecordNotFound
        messages.push("No existe producto con id #{md[:product_id]}")
      rescue ActiveRecord::RecordNotFound, NoStockException, InvalidQuantityException  => e
        messages.push("#{e.message(md[:product_id])}")
      ensure
        errors[index.to_sym] = messages if !messages.empty?
      end
    end
  end

  def validate_user(request_params, errors)
    begin
      User.find(request_params[:user_id])
    rescue ActiveRecord::RecordNotFound
      errors[:user_id] = "No existe usuario con id #{request_params[:user_id]}"
    end
  end

  def validate_client(request_params, errors)
    begin
      Client.find(request_params[:client_id])
    rescue ActiveRecord::RecordNotFound
      errors[:client_id] = "No existe cliente con id #{request_params[:client_id]}"
    end
  end

  def validate_date(request_params, errors)
    begin
      f = request_params[:date].split('-')
      Time.new(f[0], f[1], f[2])
    rescue
      errors[:date] = "Fecha inválida. Formato permitido: Y-m-d"
    end
  end

  def validate_availability(product, quantity)
      raise InvalidQuantityException if quantity < 1
      raise NoStockException if product.items_available.size < quantity
  end

end

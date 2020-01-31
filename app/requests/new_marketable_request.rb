class NewMarketableRequest
  include ActiveModel::Validations

  attr_reader :date, :client_id, :user_id, :marketable_details

  validates :date, :client_id, :user_id, :marketable_details, presence: true

  validate do |nrr|
    errors.add(:user_id, "Usuario inexistente") if User.find_by({id: @user_id}).nil?
    errors.add(:client_id, "Cliente inexistente") if Client.find_by({id: @client_id}).nil?
    begin
      f = date.split('-')
      Time.new(f[0], f[1], f[2])
    rescue
      errors.add(:date, "Fecha inválida. Formato permitido: Y-m-d")
    end
  end

  def initialize(hash)
    @date = hash[:date]
    @client_id = hash[:client_id]
    @user_id = hash[:user_id]
  end

  def errors_marketable
    e = []
    marketable_details.each do | md|

      if (md[:product_id].nil? or md[:quantity].nil?)
        e.push "El dato en details[#{marketable_details.index(md)}] no cumple el formato requerido"
        product = nil
      else
        product = Product.find_by({id: md[:product_id]})
        if product
          e.push "Cantidad inválida del product_id #{product_id}" if md[:quantity].to_s.match(/^\d+$/).nil?
          e.push "Debe enviar una cantidad mayor a 0 del product_id #{product_id}" if md[:quantity] < 1
          e.push "No hay stock del product_id  #{md[:product_id]}" if md[:quantity] > product.stock
        else
          e.push "No existe producto con id #{md[:product_id]}"
        end
      end


    end
    e
  end

end

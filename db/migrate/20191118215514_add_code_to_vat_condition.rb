class AddCodeToVatCondition < ActiveRecord::Migration[6.0]
  def change
    add_column :vat_conditions, :code, :string, null: false
  end
end

class AddPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :amount, :float, null: false
    add_column :products, :price, :float, null: false
  end
end

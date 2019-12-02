class CreateSellDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_details do |t|
      t.integer :quantity, null: false
      t.belongs_to :product, null: false
      t.belongs_to :sell, null: false

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :description
      t.text :detail
      t.float :amount, null: false

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :cuit_cuil, null: false
      t.string :email, null: false
      t.string :denomination, null: false
      t.belongs_to :vat_condition, null: false

      t.timestamps
    end
  end
end

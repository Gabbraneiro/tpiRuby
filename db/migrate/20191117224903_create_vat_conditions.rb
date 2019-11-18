class CreateVatConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :vat_conditions do |t|
      t.string :description, null: false

      t.timestamps
    end
  end
end

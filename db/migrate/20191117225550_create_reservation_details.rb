class CreateReservationDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_details do |t|
      t.integer :quantity, null: false
      t.belongs_to :product, null: false
      t.belongs_to :reservation, null: false

      t.timestamps
    end
  end
end

class CreateItemReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :item_reservations do |t|
      t.datetime :date, null: false
      t.belongs_to :item, null: false
      t.belongs_to :reservation, null: false

      t.timestamps
    end
  end
end

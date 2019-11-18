class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :date, null: false
      t.belongs_to :client, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end

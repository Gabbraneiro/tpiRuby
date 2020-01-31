class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.datetime :date, null: false
      t.belongs_to :client, null: false
      t.belongs_to :user, null: false
      t.belongs_to :reservation, null: true

      t.timestamps
    end
  end
end

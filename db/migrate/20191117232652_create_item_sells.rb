class CreateItemSells < ActiveRecord::Migration[6.0]
  def change
    create_table :item_sells do |t|
      t.datetime :date, null: false
      t.belongs_to :item, null: false
      t.belongs_to :sell, null: false

      t.timestamps
    end
  end
end

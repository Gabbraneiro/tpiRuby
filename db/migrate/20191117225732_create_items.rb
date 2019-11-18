class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :status, default: 0, null: false
      t.belongs_to :product, null: false

      t.timestamps
    end
  end
end

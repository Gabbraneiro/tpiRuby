class CreateContactPhones < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_phones do |t|
      t.string :phone, null: false
      t.belongs_to :client, null: false

      t.timestamps
    end
  end
end

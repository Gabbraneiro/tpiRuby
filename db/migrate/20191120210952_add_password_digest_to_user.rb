class AddPasswordDigestToUser < ActiveRecord::Migration[6.0]
  def change
      remove_column :users, :password, :string, null: false
      add_column :users, :password_digest, :string, null: false
  end
end

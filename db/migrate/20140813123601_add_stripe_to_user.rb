class AddStripeToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_secret_key, :string
    add_column :users, :stripe_publishable_key, :string

    add_index :users, [:stripe_publishable_key, :stripe_secret_key], :unique => true
  end
end

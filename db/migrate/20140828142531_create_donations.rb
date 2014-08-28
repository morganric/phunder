class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :stripe_email
      t.integer :user_id
      t.integer :campaign_id
      t.integer :photo_id

      t.timestamps
    end
  end
end

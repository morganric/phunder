class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :bio
      t.string :image
      t.string :image_url
      t.date :date_of_birth
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end

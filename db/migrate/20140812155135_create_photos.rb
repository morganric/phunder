class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.integer :campaign_id
      t.integer :user_id
      t.integer :paid

      t.timestamps
    end
  end
end

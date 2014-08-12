class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :target
      t.boolean :live
      t.integer :price
      t.string :image
      t.string :banner

      t.timestamps
    end
  end
end

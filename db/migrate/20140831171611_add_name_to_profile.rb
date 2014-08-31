class AddNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :display_name, :string
    add_column :profiles, :fb_image_url, :string
    add_column :profiles, :slug, :string
  end
end

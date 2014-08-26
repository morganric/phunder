class AddUrlToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :clicks, :integer, :default => 0
    add_column :photos, :views, :integer, :default => 0
    add_column :photos, :url, :string
  end
end

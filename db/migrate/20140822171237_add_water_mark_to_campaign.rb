class AddWaterMarkToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :water_mark, :string
  end
end

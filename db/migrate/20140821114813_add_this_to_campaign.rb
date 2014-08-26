class AddThisToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :end_date, :date
    add_column :campaigns, :hashtag, :string
  end
end

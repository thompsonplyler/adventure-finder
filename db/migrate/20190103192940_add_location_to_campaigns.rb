class AddLocationToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :location, :string
  end
end

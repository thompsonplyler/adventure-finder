class AddPlayerCountToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :max_players, :integer
    add_column :campaigns, :current_players, :integer
    add_column :campaigns, :average_level, :integer
    remove_column :campaigns, :players, :integer
    remove_column :campaigns, :level_max, :integer
    remove_column :campaigns, :level_min, :integer
  end
end

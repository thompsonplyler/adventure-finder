class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :players
      t.integer :level_max
      t.integer :level_min

      t.timestamps
    end
  end
end

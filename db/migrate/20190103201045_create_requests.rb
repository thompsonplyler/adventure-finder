class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.boolean   :status
      # requested, approved
      t.integer :campaign_id
      t.integer :character_id
      t.integer :user_id
      t.timestamps
    end
  end
end

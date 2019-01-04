class Campaign < ApplicationRecord
    belongs_to :user
    has_many :campaigns_characters
    has_many :characters, through: :campaigns_characters
    has_many :users, through: :campaigns_users
    has_many :requests



    def space_available?
        self.max_players > self.current_players
    end

    def self.open_campaigns
        Campaign.all.select{|campaign| campaign.space_available?}
    end

end
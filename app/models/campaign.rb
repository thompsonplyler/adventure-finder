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

    def add_character(character)
        CampaignsCharacter.create(campaign:self, character:character)
        self.current_players += 1
    end

    def self.not_mine(user)
        Campaign.all.select{|c| c.user_id != user.id}
    end
        
    def self.user_campaigns(user)
        not_mine(user).select{|c| !(c.characters & user.characters).empty?}
    end


end

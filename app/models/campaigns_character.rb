class CampaignsCharacter < ApplicationRecord
    belongs_to :character
    belongs_to :campaign
end
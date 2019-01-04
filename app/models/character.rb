class Character < ApplicationRecord
    belongs_to  :user 
    has_many    :campaigns, through: :campaign_characters
    has_many    :requests
end

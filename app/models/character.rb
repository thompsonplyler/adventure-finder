class Character < ApplicationRecord
    belongs_to  :user 
    has_many    :campaigns_characters
    has_many    :campaigns, through: :campaigns_characters
    has_many    :requests
end

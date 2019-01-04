class Request < ApplicationRecord
    belongs_to :character
    belongs_to :user
    belongs_to :campaign

    def approve
        self.status = true
    end

    def deny
        self.destroy
    end

    

    def self.live_requests
        Request.all.select{|request| request.campaign_id == campaign.id}
    end
end

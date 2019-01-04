class CampaignsCharactersController < ApplicationController
    def destroy
        @cam_user = CampaignsCharacters.find(params[:cc_id])
    end
end
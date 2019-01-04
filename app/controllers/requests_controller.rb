class RequestsController < ApplicationController
    before_action :authentication_required

    def new
        @request = Request.new
        @campaigns = Campaign.all
    end

    def create
        @request = Request.new(request_params)
        @request.status = false
        @request.user_id = current_user.id
        @request.save
        redirect_to current_user
    end

    def destroy
        @request = Request.find(params[:id])
    @request.destroy
        redirect_to current_user
    end

    def update
        @request = Request.find(params[:id])
        @request.status = true
        @camp_char = CampaignsCharacter.new
        @camp_char.character_id = @request.character_id
        @camp_char.campaign_id = @request.campaign_id
        @camp_char.save
        @request.campaign.characters << @request.character
        @request.campaign.save
        @request.character.save
        redirect_to current_user
    end

    private 

    def request_params
        params.require(:request).permit(:status, :campaign_id, :user_id, :character_id)
    end
end
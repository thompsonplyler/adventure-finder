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
        @request = Request.find(params[:r_id])
        @request.destroy
        redirect_to current_user
    end

    def update
        # byebug
        @request = Request.find(params[:r_id])
        @request.status = true
        @request.campaign.add_character(@request.character)
        @request.destroy
        redirect_to current_user
    end

    private 

    def request_params
        params.require(:request).permit(:status, :campaign_id, :user_id, :character_id)
    end
end
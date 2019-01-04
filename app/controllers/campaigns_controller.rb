class CampaignsController < ApplicationController
    before_action :authentication_required

    def new
        @campaign = Campaign.new
   end

   def create
       @campaign = Campaign.new(campaign_params)
       @campaign.user_id = current_user.id
       @campaign.save
       redirect_to users_path
   end

   def index
       @campaigns = Campaign.all
   end

   def show
       @campaign = Campaign.find(params[:id])
   end


   def edit
       @campaign = Campaign.find(params[:id])
   end

   def update
       @campaign = Campaign.find(params[:id])
       @campaign.update(campaign_params)
       redirect_to current_user
   end

   def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to current_user
   end

   private
   
   def campaign_params
       params.require(:campaign).permit(:name, :max_players, :current_players, :average_level, :location)
   end

end

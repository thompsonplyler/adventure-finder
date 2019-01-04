class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/"
        else
            render new_user_path
        end
    end

    def show
        @user = current_user
    end

    def requests
        @user = current_user 
        @requests = @user.campaigns
        @char_requests = character_requests
        @campaigns = @user.campaigns
    end

    # find requests
    # examine character
    # approve or disapprove

   

    private

    def character_requests
        current_user.requests.collect {|r| Character.find(r.character_id)}
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

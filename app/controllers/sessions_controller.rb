class SessionsController < ApplicationController
    def new
    
    end

    def create
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])  
            session[:user_id] = user.id
            redirect_to current_user
        else
            redirect_to login_path
        end
        end

    def destroy
        reset_session
        redirect_to login_path
    end
end

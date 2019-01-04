class ApplicationController < ActionController::Base
    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
                current_user ||= User.find(session[:user_id])
        end 
    end

    def valid_campaigns
        Campaign.open_campaigns.select {|campaign| campaign.user_id != current_user.id}
    end

    # I used an application controller helper_method. Even if it works, I'm not
    # sure this is the best practice. 

    helper_method :valid_campaigns 
    helper_method :current_user
end

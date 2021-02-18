class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :require_login

    private
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
        unless logged_in?
            flash[:message] = "Please log in. You cannot access this page unless you are logged in."
            redirect_to login_url
        end
    end
end

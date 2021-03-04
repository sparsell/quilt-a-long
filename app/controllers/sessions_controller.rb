class SessionsController < ApplicationController
  # skip_before_action :require_login, except: [:new, :create]

    def new
    end

    def create
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
          redirect_to user_path(user)
          else
            flash[:message] = "Incorrect login. Please try again." 
            # redirect_to '/login'
            render :new
          end
      end
    
      def destroy
        # session.clear
        session.delete :user_id
        redirect_to root_path
      end

end
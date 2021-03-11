class SessionsController < ApplicationController
  # skip_before_action :require_login, except: [:new, :create]

    def new
    end

    def create
          @user = User.find_by(email: params[:user][:email])
          if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
          else  
            flash[:message] = "Incorrect login. Please try again." 
            redirect_to '/login'
          end
      end    

      def omniauth
        # binding.pry
        @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
            user.name = auth[:info][:name]
            user.password = SecureRandom.hex(12)
          end
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = "Incorrect login. Please try again." 
          redirect_to '/login'
        end
      end
      
      def destroy
        # session.clear
        session.delete :user_id
        redirect_to root_path
      end

      private 

        def auth
          request.env['omniauth.auth']
        end

end
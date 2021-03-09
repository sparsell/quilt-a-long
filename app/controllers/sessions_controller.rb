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


      def github
        user = User.find_or_create_from_github(auth)
          if user.valid?
              session[:user_id] = user.id
              redirect_to user
          else
            render :new
          end
      end

      def google
        # binding.pry
        @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
          user.name = auth[:info][:name]
          user.password = SecureRandom.hex(12)
        end
    
        if @user.save
          redirect_to user_path(@user)
        else
          redirect_to '/'
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
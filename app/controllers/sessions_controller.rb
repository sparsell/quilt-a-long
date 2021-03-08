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
          # pp request.env['omniauth.auth']
          # session[:name] = request.env['omniauth.auth']['info']['name']
          # redirect_to root_path
    
      def google
        user = User.create_from_omniauth(auth)
          if user.valid?
              session[:user_id] = user.id
              redirect_to user
          else
            render :new
          end
      end

      def github
        binding.pry
        user = User.create_from_github(auth)
        
          if user.valid?
              session[:user_id] = user.id
              redirect_to user
          else
            render :new
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
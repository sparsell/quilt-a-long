class UsersController < ApplicationController

    def new
    end

    def create
        
        if params[:user][:password] == params[:user][:password_confirmation]
            binding.pry
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

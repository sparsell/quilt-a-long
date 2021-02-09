class UsersController < ApplicationController
    

    def new
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        
        else
            redirect_to '/'
        end
    end

    def show
        if params[:id]
        @user = User.find_by(id: params[:id])
        else @user = current_user
        end
        @quilters = Quilter.all
        @qals = Qal.all
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update

    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

end

class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if params[:user][:password] == params[:user][:password_confirmation] && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "That was not a valid signup attempt. Please try again"
            redirect_to signup_path
        end
    end

    def show
        @user = current_user
        @qals = current_user.qals.all 
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path
        else
            render :edit
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_name, :quilting_style)
        end

end

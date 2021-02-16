class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def create
        # binding.pry
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to login_path
        else
            flash[:message] = "That is not a valid signup. Please try again"
            render :new
        end
    end

    def show
        @user = current_user
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

        def logged_in_user 
            unless logged_in?
                flash[:message] = "Please log in."
                redirect_to login_url
            end
        end

end

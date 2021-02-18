class QalsController < ApplicationController
    before_action :require_login
    
    def new
        @qal = Qal.new
    end

    def create
        @qal = current_user.qals.build(qal_params)
        if @qal.save
            redirect_to current_user
        else
            render :new
        end
    end

    def show
        @qal = Qal.find_by(id: params[:id])
    end

    def edit
        @qal = Qal.find_by(id: params[:id])
    end

    def update
        # binding.pry
        @qal = Qal.find_by(id: params[:id])
        if @qal.update(qal_params)
            redirect_to qal_path
        else
            render :edit
        end
    end

    def destroy
        @qal = Qal.find(params[:id])
        binding.pry
        @qal.destroy
        redirect_to qals_path
    end

    def index
        @qals = Qal.all
        @users = User.all
        # @quilts = Quilts.all
        # @quilters = Quilters.all

    end


    private

    def qal_params
        params.require(:qal).permit(:qal_name, :start_date, :end_date)
    end

end
class QalsController < ApplicationController
    # before_action :require_login
    
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
        @qal = Qal.find(id: params[:id])
        if @qal.update(qal_params)
            redirect_to qal_path
        else
            render :edit
        end
    end

    def index
        @qals = Qal.all
    end


    private

    def qal_params
        params.require(:qal).permit(:qal_name, :start_date, :end_date)
    end

end
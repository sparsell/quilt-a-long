class QalsController < ApplicationController
    # before_action :require_login
    
    def new
        @qal = Qal.new
    end

    def create
        @qal = current_user.qals.build(qal_params)
        if @qal.save
            redirect_to qals_path
        else
            render :new
        end
    end

    def show
        @qal = Qal.find_by(id: params[:id])
    end

    def index
        @qals = Qal.all
    end


    private

    def qal_params
        params.require(:qal).permit(:qal_name, :start_date, :end_date)
    end

end
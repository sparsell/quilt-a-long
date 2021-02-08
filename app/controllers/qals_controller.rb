class QalsController < ApplicationController
    # before_action :require_login
    
    def new
        @qal = Qal.new
    end

    def create
        #need to associate qal with user
        @qal = current_user.qals.build(qal_params)
        if @qal 
            redirect_to qal_path(@qal)
        else
            redirect_to new_qal_path
        end
    end

    def show
        @qal = Qal.find_by(id: params[:id])
    end

    private

    def qal_params
        params.require(:qal).permit(:qal_name, :start_date, :end_date)
    end

end
class QalsController < ApplicationController
    before_action :require_login
    
    def new
        @quilters = Quilter.all
        @qal = Qal.new
        #has_many associations:
        @qal.quilters.build
        @qal.sponsors.build
        @qal.prizes.build
    end

    def create
        @qal = current_user.qals.create(qal_params)
        if @qal.save
            redirect_to qal_path(@qal)
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
        @qals = Qal.all
        @qal = Qal.find_by(id: params[:id])
        if @qal.update(qal_params)
            redirect_to qal_path
        else
            render :edit
        end
    end

    def destroy
        @qal = Qal.find(params[:id])
        @qal.destroy
        redirect_to current_user
    end

    def index
        @qals = Qal.all
        @users = User.all
    end


    private

    def qal_params
        # params.require(:qal).permit(:qal_name, :start_date, :end_date, :quilting_style, :skill_level, quilters_attributes: [:id, :quilter_name])
        params.require(:qal).permit(:qal_name, :start_date, :end_date, :quilting_style, :skill_level, quilter_ids:[])
    end

end
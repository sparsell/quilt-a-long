class QalsController < ApplicationController
    before_action :require_login
    
    def new
        @qal = Qal.new
        @quilters = Quilter.all
        @sponsors = Sponsor.all
        @prizes = Prize.all
        #has_many associations:
        @qal.quilters.build
        @qal.prizes.build
        @qal.sponsors.build
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
        params.require(:qal).permit(:qal_name, :start_date, :end_date, :quilting_style, :skill_level, quilter_ids:[], prize_ids:[], quilters_attributes: [:id, :quilter_name], prizes_attributes: [:id, :prize_name])
        # params.require(:qal).permit(:qal_name, :start_date, :end_date, :quilting_style, :skill_level, quilter_ids:[])
    end

end
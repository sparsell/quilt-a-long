class PrizesController < ApplicationController
      before_action :require_login
      
    def index 
      @prizes = Prize.all
    end

    def show
        @prize = Prize.find_by(id: params[:id])
    end

    def new
        @prize = Prize.new
    end

    def create
        @prize = Prize.create(prize_params)
        @qal = params[:qal_id]
        if @prize.save
            redirect_to sponsors_path
        else
            render :new
        end
    end

    def edit
        @prize = Prize.find_by(id: params[:id])
    end

    def update
        @prize = Prize.find_by(id: params[:id])
        @qal = @prize.qal_id
        if @prize.update(prize_params)
            flash[:message] = "Successfully updated Prize"
            redirect_to qal_prizes_path(@qal)
        else
            render :edit
        end
    end

    def destroy
        @prize = Prize.find_by(id: params[:id])
        @qal = @prize.qal_id
        if 
        @prize.destroy
            flash[:message] = "Prize was successfully deleted."
            redirect_to qal_prizes_path(@qal)
        end
    end

end

private 

    def prize_params
        params.require(:prize).permit(:prize_name, :qal_id, :sponsor_id)
    end

class PrizesController < ApplicationController
      before_action :require_login
      
    def index 
        if
        @prizes = Prize.where(qal_id: params[:qal_id])
        else 
            flash[:message] = "There aren't any prizes for this Quilt-A-Long"
        end
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
            flash[:message] = "Successfully added Prize."
            redirect_to sponsors_path
            # redirect_to qal_prizes_path(@qal)
        else
            render :new
        end
    end

    def edit
        @prize = Prize.find_by(id: params[:id])
    end

    def update
    end

    def destroy
        # binding.pry
        @prize = Prize.find_by(id: params[:id])
        if 
        @prize.destroy
            flash[:message] = "Prize was successfully destroyed."
            redirect_to qals_path
        end
    end

end

private 

    def prize_params
        params.require(:prize).permit(:prize_name, :qal_id, :sponsor_id)
    end

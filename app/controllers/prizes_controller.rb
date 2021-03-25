class PrizesController < ApplicationController

    def index 
    end

    def show
    @prize = Prize.find_by(id: params[:id])
    end

    def new
        @prize = Prize.new
        # @qals = Qal.all
    end

    def create
        @prize = Prize.create(prize_params)
    end

end

private 

    def prize_params
        params.require(:prize).permit(:prize_name, sponsor_attributes: [:id, :sponsor_name])
    end

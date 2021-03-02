class PrizesController < ApplicationController

    def index 
    end

    def show
    end

    def new
        @prize = Prize.new
    end

    def create
        @prize = Prize.create(params: prize_params)
    end

end

private 

    def prize_params
        params.require(:prize).permit(:prize_name, sponsor_attributes: [:id, :sponsor_name])
    end

class PrizesController < ApplicationController

    def index 
        @prizes = Prize.all
    end

    def show
    @prize = Prize.find_by(id: params[:id])
    end

    def new
        @prize = Prize.new
        # @sponsor = Sponsor.find_by(id: params[:sponsor_id])
        # binding.pry
       
    end

    def create
        @prize = Prize.create(prize_params)
        if @prize.save
            redirect_to prizes_path
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

end

private 

    def prize_params
        params.require(:prize).permit(:prize_name, :qal_id, :sponsor_id)
    end

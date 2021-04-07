class SponsorsController < ApplicationController
    before_action :require_login

    def index
        @sponsors = Sponsor.all
        @qals = Qal.all #has many QALs through prizes
        @prizes = Prize.all  #has many prizes

    end

    def show
        @sponsor = Sponsor.find_by(id: params[:id])
    end

    def new
        @sponsor = Sponsor.new
    end

    def create
        @sponsor = Sponsor.create(sponsor_params)
        if @sponsor.save
            redirect_to sponsors_path
        else
            render :new
        end
    end

    def edit
        @sponsor = Sponsor.find_by(id: params[:id])
    end

    def update
        @sponsor = Sponsor.find_by(id: params[:id])
        @sponsor.update(sponsor_params)
        if @sponsor.save
            flash[:message] = "Successfully updated Sponsor."
        redirect_to sponsors_path
        else  
            render :edit
        end
    end

    def destroy
        @sponsor = Sponsor.find(params[:id])
        if @sponsor.delete
            flash[:message] = "Successfully deleted Sponsor."
        redirect_to sponsors_path
        else   
            render :edit  
        end
    end


    private 
        def sponsor_params
            params.require(:sponsor).permit(:sponsor_name)
        end
end

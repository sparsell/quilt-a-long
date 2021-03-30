class SponsorsController < ApplicationController
    before_action :require_login

    def index
    #  binding.pry
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
            flash[:message] = "#{@sponsor.sponsor_name} is already a Sponsor. Please try again."
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
        redirect_to sponsor_path(@sponsor)
        else  
            render :edit
        end
    end

    def destroy
        @sponsor = Sponsor.find(params[:id])
        @sponsor.delete
        redirect_to sponsors_path
    end


    private 

        def sponsor_params
            params.require(:sponsor).permit(:sponsor_name)
        end

end

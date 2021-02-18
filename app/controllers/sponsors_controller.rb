class SponsorsController < ApplicationController
    before_action :require_login

    def index
        @sponsors = Sponsor.all

    end

    def show
        @sponsor = Sponsor.find_by(id: params[:id])
    end

    def new
        @sponsor = Sponsor.new
    end

    def create
        @sponsor = Sponsor.create(sponsor_params)
    end

    private 

        def sponsor_params
            params.require(:sponsor).permit(:sponsor_name)
        end

end

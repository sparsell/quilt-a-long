class QuiltsController < ApplicationController

    def index
    end

    def new
        @quilt = Quilt.new
        @quilters = Quilter.all
    end

    def create
            @quilt = Quilt.create(quilt_params)
            redirect_to quilt_path(@quilt)
    end

    def show
        @quilt = Quilt.find_by(id: params[:id])
    end

    private

        def quilt_params
            params.require(:quilt).permit(:quilt_name) 
        end

end
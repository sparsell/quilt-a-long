class QuiltsController < ApplicationController
    before_action :require_login

    def index
    end

    def new
        @quilt = Quilt.new
        @quilters = Quilter.all
    end

    def create
            @quilt = Quilt.create(quilt_params)
            if @quilt.save
            redirect_to quilt_path(@quilt)
            else
                render :new
            end
    end

    def show
        @quilt = Quilt.find_by(id: params[:id])
    end

    private

        def quilt_params
            params.require(:quilt).permit(:quilt_name, :is_finished, :quilter_id) 
        end

end
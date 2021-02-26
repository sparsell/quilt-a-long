class QuiltsController < ApplicationController
    before_action :require_login

    def index
        @quilts = Quilt.all
    end

    def new
        @quilt = Quilt.new
        @quilters = Quilter.all
    end

    def create
            @quilter = Quilter.find_by(id: params[:id])
            @quilt = @quilter.quilts.build(quilt_params)
            if @quilt.save
            redirect_to quilter_path(@quilter)
            else
                render :new
            end
    end

    def show
        @quilt = Quilt.find_by(id: params[:id])
        # binding.pry
    end

    private

        def quilt_params
            params.require(:quilt).permit(:quilt_name, :is_finished, :quilter_id) 
        end

end
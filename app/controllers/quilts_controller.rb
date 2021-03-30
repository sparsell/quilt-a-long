class QuiltsController < ApplicationController
    before_action :require_login

    def index
        @quilts = Quilt.all
    end

    def new
        @quilt = Quilt.new
        @qals = Qal.all
    end

    def create
        # binding.pry
            @quilter = Quilter.find_by(id: params[:quilter_id])
            binding.pry
            # @quilt = @quilt.build_quilter(quilt_params)
            # binding.pry
            if @quilt.save
            redirect_to quilter_quilts_path(@quilter)
            else
                render :new
            end
    end

    def show
        @quilt = Quilt.find_by(id: params[:id])
    end

    private

        def quilt_params
            params.require(:quilt).permit(:quilt_name, :is_finished, :quilter_id, :qal_id) 
        end

end
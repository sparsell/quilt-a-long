class QuiltsController < ApplicationController
    before_action :require_login

    def index
        @quilts = Quilt.all
    end

    def new
        @quilter = Quilter.find_by(id: params[:quilter_id])
        @qal = @quilter.qal_id
        @quilt = Quilt.new
        @quilt.build_qal
        @quilt.build_quilter
        @qals = Qal.all
    end

    def create
        @quilt = Quilt.new(quilt_params)
            if @quilt.save
            redirect_to quilters_path
            else
                render :new
            end
    end

    private

        def quilt_params
            params.require(:quilt).permit(:quilt_name, :is_finished, :quilter_id, :qal_id) 
        end

end
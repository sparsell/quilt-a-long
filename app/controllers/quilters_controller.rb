class QuiltersController < ApplicationController

    def new
        @quilter = Quilter.new
    end

    def create
        @quilter = current_user.quilters.build(quilter_params)
        if @quilter.save
            redirect_to quilters_path
        else
            render :new
        end
    end

    def show
        @quilter = Quilter.find_by(id: params[:id])
        @qals = Qal.all
    end

    def index
        @quilters = Quilter.all
    end

    private

        def quilter_params
            params.require(:quilter).permit(:quilter_name)
        end

end
class QuiltersController < ApplicationController
    before_action :require_login

    def index
        @quilters = Quilter.all 
        @qals = Qal.all
        @quilts = Quilt.all
        # @quilters_with_finished_quilts = Quilter.quilters_with_finished_quilts.count
    end

    
    def new
        @quilter = Quilter.new
        @qals = Qal.all
        @quilter.quilts.build
      
    end

    def create
        @quilter = Quilter.new(quilter_params)
        if @quilter.save
            redirect_to @quilter
        else
            flash[:message] = "That name is already taken. Please choose another."
            render :new
        end
    end

    def show
        @quilter = Quilter.find_by(id: params[:id])
        @qal = @quilter.qal
      
    end

    def edit
        @quilter = Quilter.find_by(id: params[:id])
    end

    def update
        @quilter = Quilter.find_by(id: params[:id])
        if @quilter.update(quilter_params)
            flash[:message] = "Successfully updated Quilter"
            redirect_to quilter_path(@quilter)
        else
            render :edit
        end    
    end

    def destroy
        @quilter = Quilter.find(params[:id])
        @quilter.destroy
            redirect_to quilters_path
    end

    private

        def quilter_params
            # params.require(:quilter).permit(:quilter_name, :qal_id, quilts_attributes: [:quilt_name, :is_finished])
            params.require(:quilter).permit(:id, :quilter_name, :qal_id)

        end

end
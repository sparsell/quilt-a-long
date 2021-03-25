class QuiltersController < ApplicationController
    before_action :require_login

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
            binding.pry
            render :new
        end
    end

    def show
        @quilter = Quilter.find_by(id: params[:id])
      
    end

    def edit
        @quilter = Quilter.find_by(id: params[:id])
    end

    def update
        @quilter = Quilter.find_by(id: params[:id])
    #    binding.pry
        if @quilter.update(quilter_params)
            #  binding.pry
            flash[:message] = "Successfully updated Quilter"
            redirect_to quilter_path(@quilter)
        else
            render :edit
        end    
    end

    def index
        @quilters = Quilter.all 
        @qals = Qal.all
        @quilts = Quilt.all
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
class QuiltersController < ApplicationController
    before_action :require_login

    def new
        @quilter = Quilter.new
    end

    def create
        @quilter = Quilter.new(quilter_params)
        # binding.pry
        if @quilter.save 
            redirect_to quilter_path(@quilter)
        else
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
        if @quilter.update(quilter_params)
            flash[:message] = "Successfully updated Quilt-A-Long"
            redirect_to quilter_path(@quilter)
        else
            render :edit
        end    
    end

    # def update
    #     @qal = Qal.find_by(id: params[:id])
    #     if @qal.update(qal_params)
    #         redirect_to qal_path(@qal)
    #     else
    #         render :edit
    #     end
    # end

    def index
        @quilters = Quilter.all 
        @qals = Qal.all
    end

    def destroy
        @quilter = Quilter.find(params[:id])
        @quilter.destroy
            redirect_to quilters_path
    end

    private

        def quilter_params
            params.require(:quilter).permit(:quilter_name, :qal_name, quilts: [])
        end

end
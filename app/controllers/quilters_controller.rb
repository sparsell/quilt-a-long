class QuiltersController < ApplicationController
    before_action :require_login

    def new
        @quilter = Quilter.new
        # @quilters = Quilter.all
    end

    def create
        @quilter = Quilter.create(quilter_params)
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
        @quilters = Quilter.all
        @quilter = Quilter.find_by(id: params[:id])
        if @quilter.update(quilter_params)
            redirect_to quilter_path
        else
            render :edit
        end    
    end


    def index
        @quilters = Quilter.all 
    end

    def quilts_index
        @quilter = Quilter.find(params[:id])
        @quilts = @quilter.quilts
        render template: 'quilts/index'
      end
     
      def quilt
        @quilter = Quilter.find(params[:id])
        @quilt = Quilt.find(params[:quilt_id])
        render template: 'quilts/show'
      end

    private

        def quilter_params
            params.require(:quilter).permit(:quilter_name, :qal_name)
        end

end
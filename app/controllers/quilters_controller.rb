class QuiltersController < ApplicationController
    before_action :require_login

    def new
        @quilter = Quilter.new
        @quilters = Quilter.all
    end

    def create
        # binding.pry
        @quilter = current_user.quilters.build(quilter_params)
        if @quilter.save 
            redirect_to quilter_path(@quilter)
        else
            render :new
        end
    end

    def show
        @quilter = Quilter.find_by(id: params[:id])
      
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
            params.require(:quilter).permit(:quilter_name)
        end

end
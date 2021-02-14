class QuiltersController < ApplicationController

    def new
        @quilter = Quilter.new
        @quilters = Quilter.all
    end

    def create
        # binding.pry
        @quilter = current_user.quilters.build(quilter_params)
        if @quilter.save 
            redirect_to current_user
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
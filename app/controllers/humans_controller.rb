class HumansController < ApplicationController
    def index
        @humans = Human.all
    end

    def new
        @human = Human.new
      end
    
      def create
        human = Human.new(human_params)
        if human.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @human = Human.find(params[:id])
      end

      def destroy
        human = Human.find(params[:id])
        human.destroy
        redirect_to action: :index
      end
    
      private
      def human_params
        params.require(:human).permit(:name, :image, :content)
      end
end

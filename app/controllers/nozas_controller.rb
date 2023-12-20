class NozasController < ApplicationController
    def index
        @humans = Noza.all
    end

    def new
        @human = Noza.new
      end
    
      def create
        human = Noza.new(human_params)
        if human.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @humen=Noza.find(params[:id])
        @comments = @humen.comments
        @comment = Comment.new
      end

      def edit
        @human = Noza.find(params[:id])
      end

      def update
        human = Noza.find(params[:id])
        if human.update(human_params)
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        noza = Noza.find(params[:id])
        noza.destroy
        redirect_to action: :index
      end
    
      private
      def human_params
        params.require(:noza).permit(:id, :name, :image, :content)
      end
end


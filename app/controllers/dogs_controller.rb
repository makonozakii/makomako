class DogsController < ApplicationController
    def cat
    end

    def bird
      @dogs = Dog.all
    end

    def panda
      @dogs = Dog.find(params[:id])
      @comments = @dogs.comments
      @comment = Comment.new
  end

    def lion
    end

    def index
    end

    def haruka
      dog = Dog.create(dog_params)
      if dog.save
        redirect_to :action => "bird"
      else
        redirect_to :action => "bird"
      end
    end

    def new
      @dog = Dog.new
    end
  
    def show
      @dog = Dog.find_by(id: params[:id])
    end
  
    def create
      @dog = Dog.new(dog_params)
      params[:dog][:question] ? @dog.question = params[:dog][:question].join("") : false
      if @dog.save
          flash[:notice] = "診断が完了しました"
          redirect_to dog_path(@dog.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def dog_params
        params.require(:dog).permit(:name, :image, :content, question: [])
    end
  end

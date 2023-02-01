class CategoriesController < ApplicationController

    def index 
        @category = Category.all
    end

  def new
    @category = Category.new
  end

  def show 
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity 
    end
  end

 

  private
  def category_params
    params.require(:category).permit(:name, :description, :active)
  end
end

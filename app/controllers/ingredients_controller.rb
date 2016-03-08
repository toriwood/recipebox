class IngredientsController < ApplicationController
    before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def ingredient
    @ingredient ||= Ingredient.find(params[:id])    
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :recipe_id)
  end
end

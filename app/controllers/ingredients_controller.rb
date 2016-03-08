class IngredientsController < ApplicationController
    before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:ingredient][:recipe_id])
  end

  def edit
    @recipe = Recipe.find(ingredient.recipe_id)
  end

  def update
    ingredient.update(ingredient_params)

    if @ingredient.save
      flash[:success] = "Updated successfully"
      redirect_to recipe_path(ingredient_params[:recipe_id])
    else
      flash[:danger] = "There was a problem updating this record."
      redirect_to edit_ingredient_path(params[:recipe_id])
    end
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    if @ingredient.save
      flash[:success] = "Added successfully"
      redirect_to recipe_path(ingredient_params[:recipe_id])
    else
      flash[:danger] = "There was a problem adding this record."
      redirect_to new_ingredient_path(params[:recipe_id])
    end
  end

  def destroy
    @recipe = Recipe.find(ingredient.recipe_id)
    ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def ingredient
    @ingredient ||= Ingredient.find(params[:id])    
  end

  helper_method :ingredient

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :recipe_id)
  end
end

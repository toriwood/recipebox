class RecipesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def create
    @recipe = Recipe.create(recipe_params)
    
    if @recipe.save
      flash[:success] = "Recipe added successfully."
      redirect_to recipes_path
    else
      flash[:danger] = "There was a problem creating this recipe."
      redirect_to new_recipe_path
    end
  end

  def update
  end

  def destroy
  end


  private 

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  helper_method :recipe

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :user_id)
  end
end

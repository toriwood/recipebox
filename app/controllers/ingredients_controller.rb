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
end

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    if params[:search]
      @recipes = Recipe.global_search(params[:search]).order("created_at DESC")
    else
      @recipes = Recipe.all
    end
  end
  def show
    @recipe = Recipe.find(params[:id])
  end


end


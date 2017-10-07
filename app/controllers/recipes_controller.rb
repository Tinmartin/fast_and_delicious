class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    if params[:search]
      if params[:search] == ""
        @recipes = Recipe.all
      else
        # @recipes = Recipe.global_search(params[:search]).order("created_at DESC")
        @recipes = Recipe.search(params[:search]).order("created_at DESC")
      end
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


end


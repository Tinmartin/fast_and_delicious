class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    if params[:search]
      if params[:search] == ""
        @recipes = Recipe.all
        respond_to do |format|
        format.html { redirect_to search_recipes_path}
        format.js
        end
      else
        @recipes = Recipe.global_search(params[:search]).order("created_at DESC")
        respond_to do |format|
        format.html { redirect_to search_recipes_path }
        format.js
        end
      end
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end
end


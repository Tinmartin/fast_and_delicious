class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    if params[:search]
      if params[:search] == ""
        @recipes = Recipe.all
      else
        @recipes = Recipe.global_search(params[:search]).order("created_at DESC")
      end
    else
      @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end


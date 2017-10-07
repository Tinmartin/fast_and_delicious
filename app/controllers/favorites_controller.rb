class FavoritesController < ApplicationController
  before_action :load_recipe

  def update
    @recipe.favorite!
  end

  def destroy
    @recipe.unfavorite!
  end

  private

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end


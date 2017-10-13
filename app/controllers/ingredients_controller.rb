class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    get_ingredient
  end

  def edit
    get_ingredient
  end

  def update
    get_ingredient
    @ingredient.update(ingredient_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to ingredient_path(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    # no need for app/views/restaurants/update.html.erb
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    get_ingredient
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :picture, :can_change)
  end

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end

class FavoritesController < ApplicationController
  def create
    if current_user
      @favorite = Favorite.new(
        user_id: current_user.id,
        recipe_id: params[:recipe_id]
        )
      if @favorite.save
        redirect_to root_path
      end
    end
  end

  def destroy
    if current_user
      Favorite.where(recipe_id: params[:id], user_id: current_user.id).delete_all
    end
    redirect_to root_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :recipe_id)
  end
end



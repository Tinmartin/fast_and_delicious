class ProfilesController < ApplicationController

  def show
    @profile = current_user.profile
    @favorites = current_user.favorites
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to profile_path(@profile)
  end

  private

  def get_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :picture, :user_id, :user_name, :quote)
  end
end


class ProfilesController < ApplicationController

  def show
    @profile = current_user.profile
    fail
  end

  private

    def find_profile
      @profile = Profile.find(params[:id])
    end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :picture, :user_id)
  end
end


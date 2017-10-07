class DosesController < ApplicationController


  def update
    get_dose
    @dose.update(ingredient_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to ingredient_path(@ingredient)
  end

  def dose_params
    params.require(:dose).permit(:unit, :quantity)
  end

  def get_dose
    @dose = Dose.find(params[:id])
  end

end

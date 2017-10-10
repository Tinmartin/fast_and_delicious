ActiveAdmin.register Dose do

  permit_params :quantity, :unit, :description, :ingredient_id, :recipe_id

end

ActiveAdmin.register Recipe do

  permit_params :name, :description, :calories, :cooking_time, :preparation_time

end

ActiveAdmin.register Recipe do

  permit_params :name, :picture, :description, :calories, :cooking_time, :preparation_time

end

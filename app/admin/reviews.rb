ActiveAdmin.register Review do

  permit_params :content, :picture, :rating, :user_id, :recipe_id

end

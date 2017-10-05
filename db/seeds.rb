puts 'Creating Ingredients...'


steak = Ingredient.create(name: "steak")
carott = Ingredient.create(name: "carott")
Ingredient.create(name: "parsley")
Ingredient.create(name: "olive oil")
Ingredient.create(name: "pork filet mignon")
Ingredient.create(name: "leek")
Ingredient.create(name: "mustard")


puts 'Creating Recipes...'


pork_with_leek = Recipe.new(
  name: "PORK WITH LEEK",
  description: "- Split the leek in half. Wash it under cold water and dip it for 3 min in boiling water.
    - Brush the filet of mustard and wrap it thanks to the leek. Cook for 40 minutes in a steamer. Salt and pepper.
    - Cut into thick slices and enjoy with salad and mustard sauce.",
  cooking_time: "43 min",
  preparation_time: "15m in",
  calories: 135,
)
pork_with_leek.remote_picture_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# pork_with_leek.remote_photo_url = "http://cache.marieclaire.fr/data/photo/w1000_c17/cuisine/i13c/cvf090_064.jpg"
pork_with_leek.save!


beef_carrots_at_the_stove = Recipe.new(
  name: "BEEF CARROTS AT THE STOVE",
  description: "- Peel and grate the carrots. Cut the meat into small pieces. Wash and chop the flat parsley.
    - Heat the oil in a frying pan and sear the pieces of meat. Let cook 1min over high heat and add carrots and parsley. Salt, pepper, cook 2 min more while stirring and taste.",
  cooking_time: "3 min",
  preparation_time: "10 min",
  calories: 299,
)
# beef_carrots_at_the_stove.remote_photo_url = "https://images.ricardocuisine.com/services/recipes/1074x1074_5730-background.jpg"
beef_carrots_at_the_stove.save!


dose_beef_carrots_at_the_stove_steak = Dose.new(quantity: 1)
dose_beef_carrots_at_the_stove_steak.ingredient = steak
dose_beef_carrots_at_the_stove_steak.recipe = beef_carrots_at_the_stove
dose_beef_carrots_at_the_stove_steak.save!

puts 'Finished!'

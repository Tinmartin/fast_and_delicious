namespace :db do

  task :create_files => :environment do


    require 'open-uri'
    require 'nokogiri'
    require 'pry-byebug'
    user_agent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"

    Recipe.destroy_all
    Ingredient.destroy_all
    Dose.destroy_all

    i = 0

    #while i < 29 do=
    doc = Nokogiri::HTML(open("https://www.jamieoliver.com/recipes/category/books/5-ingredients-quick-easy-food-recipes/", "User-Agent" => user_agent), nil, 'utf-8')

    doc.search(".recipe-block > a").each do |recipe|
      i+=1
      #binding.pry
      doc = Nokogiri::HTML(open("https://www.jamieoliver.com#{recipe['href']}/", "User-Agent" => user_agent), nil, 'utf-8')
      doc.search(".recipe-container").each do |item|
        puts "Creating recipe"
        name = item.search('h1.hidden-xs').text
        description1 = item.search('.method-p').text.strip.gsub("\\n|\s", " ").split(' ')
        description1.delete_at(0)
        description = description1.join(' ')
        cooking_time = item.search('.recipe-detail.time').text.strip.gsub("\\n|\s|\W"," ").split(' ').join(' ').downcase.gsub("cooks in","")
        serves = item.search('.recipe-detail-serves').text.to_i
        calories =  item.search('.nutrition-item:nth-of-type(1) .nutrition-item-top').text.to_f
        recipe = Recipe.new(name:name, description:description, cooking_time: cooking_time, calories:calories)
        recipe.remote_picture_url = "https:#{item.search('.recipe-header-left img').first['src']}"
        recipe.save!

        doc.search(".ingredient-wrapper li").each do |element|
          puts "Creating ingredient"
          ingredient_name = element.text.strip.gsub("\\n|\s"," ").split(' ').join(' ').scan(/(?<=\sof\s)(?!.*\sof\s).+|(?<=\sg\s)(?!.*\sg\s).+/)
          ingredient = Ingredient.new(name: ingredient_name.first)
          ingredient.save!
          array = element.text.strip.gsub("\\n|\s", " ").split(' ').join(' ').scan(/(^\d\/\d)|(^.*\d*)\s(g\s|l|kg|tablespoons|tablespoon|a bunch|a pinch|sprigs|cloves)|(^\d+)/).flatten
          sleep 1
          if array[1] && array[2]
            if array[1].to_i.is_a?(Fixnum) && array[2]
              quantity = array[1].to_i
              unit = array[2].to_s
              dose = Dose.new(quantity:quantity, unit:unit, ingredient:ingredient, recipe:recipe)
              dose.save!
            elsif array[3]
              quantity = array[3].to_i
              dose = Dose.new(quantity:quantity, recipe:recipe, ingredient:ingredient)
              dose.save!
            else
              quantity = operate(array[0])
              dose = Dose.new(quantity:quantity,recipe:recipe, ingredient:ingredient)
              dose.save!
            end
          else
          end
        end
      end
    end
    #end

    def operate(array)
      sum = 0
      a = array[0].to_f
      b = array[2].to_f
      operator = array[1].strip
      if operator == "x"
        sum = a * b
      elsif operator == "/"
        sum = a / b
      end
      sum
    end









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
      preparation_time: "15 min",
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



  end
end

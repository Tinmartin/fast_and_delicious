namespace :db do

  task :create_files => :environment do


    require 'open-uri'
    require 'nokogiri'

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
        name = item.search('h1.hidden-xs').text.downcase
        description1 = item.search('.method-p').text.strip.gsub("\\n|\s", " ").split(' ')
        description1.delete_at(0)
        description = description1.join(' ')
        cooking_time = item.search('.recipe-detail.time').text.strip.gsub("\\n|\s|\W"," ").split(' ').join(' ').downcase.gsub("cooks in","")
        serves = item.search('.recipe-detail-serves').text.to_i
        calories =  item.search('.nutrition-item:nth-of-type(1) .nutrition-item-top').text.to_f
        recipe = Recipe.new(name:name, description:description, cooking_time: cooking_time, calories:calories)
        # recipe.remote_picture_url = "https:#{item.search('.recipe-header-left img').first['src']}"
        recipe.save!

        doc.search(".ingredient-wrapper li").each do |element|
          puts "Creating ingredient"

          ingredient_name1 = element.text.strip.gsub("\\n|\s"," ").split(' ').join(' ').scan(/^([^ ]+)\s?(kg|cm|teaspoon|teaspoons|l|ml|cl|mg|sprigs|g|tablespoon|tablespoons|a bunch|pack)?\s(of)?([^,\n]*).*$/).flatten
          ingredient_name = ingredient_name1[3]
          ingredient = Ingredient.new(name:ingredient_name.downcase)
          ingredient.save!
          array = element.text.strip.gsub("\\n|\s", " ").split(' ').join(' ').scan(/(^\d\/\d)|(^.*\d*)\s(g\s|l\s|kg|ml|cl|mg|cm|tablespoons|tablespoon|teaspoon|teaspoons|a bunch|a pinch|sprigs|cloves)|(^\d+)/).flatten
          sleep 0.1

          if !(array[1].to_i.is_a?(Fixnum)) && array[2]
            quantity = operate(array[1].strip)
            binding.pry
            dose = Dose.new(quantity:quantity,recipe:recipe, ingredient:ingredient)
            dose.save!
          elsif array[1].to_i.is_a?(Fixnum) && array[2]
            quantity = array[1].to_i
            unit = array[2].to_s
            dose = Dose.new(quantity:quantity, unit:unit, ingredient:ingredient, recipe:recipe)
            dose.save!
          elsif array[0]
            quantity = operate(array[0].strip)
            dose = Dose.new(quantity:quantity,recipe:recipe, ingredient:ingredient)
            dose.save!
          elsif array[3]
            quantity = array[3].to_i
            dose = Dose.new(quantity:quantity, recipe:recipe, ingredient:ingredient)
            dose.save!
          end
        end
      end
    end
    #end

    def operate(array)
      regex = /(\d+)\s?(x|\/)\s?(\d+)/
      array = i.scan(regex).flatten
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
  end
end

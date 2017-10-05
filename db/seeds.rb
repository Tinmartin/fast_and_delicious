require 'open-uri'
require 'nokogiri'
user_agent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"

Recipe.destroy_all
Ingredient.destroy_all

doc = Nokogiri::HTML(open("https://www.jamieoliver.com/recipes/category/books/5-ingredients-quick-easy-food-recipes/", "User-Agent" => user_agent), nil, 'utf-8')
doc.search(".recipe-title.innerHTML").each do |recipe|
  doc = Nokogiri::HTML(open("https://www.jamieoliver.com/recipes/beef-recipes/#{recipe}/"), nil, 'utf-8', "User-Agent" => user_agent)
  doc.search(".recipe-container").each do |item|

    name = item.search('h1.hidden-xs').text
    description = item.search('.method-p').text
    cooking_time = item.search('.recipe-detail.time').text
    serves = item.search('.recipe-detail-serves').text.to_i
    calories =  item.search('ul.nutrition-item:nth-of-type(1)').text.to_f
    recipe = Recipe.new(name:name, description:description, cooking_tine:cooking_time, calories:calories)
    recipe.remote_photo_url = "https:#{item.search('.recipe-header-left img')['src']}"
    recipe.save!

    doc.search(".ingredient-wrapper").each do |element|
      ingredient = element.sub(/(^.*\d*)\s(g\s|l|kg|tablespoons|tablespoon|a bunch|a pinch)/)
      Ingredient.new(ingredient)
      ingredient.save!

      array = element.scan(/(^\d\/\d)|(^.*\d*)\s(g\s|l|kg|tablespoons|tablespoon|a bunch|a pinch|sprigs|cloves)|(^\d+)/)
      if array[1] && array[2]
       if array[1].to_i.is_a? Integer && array[2]
        quantity = array[1].to_i
        unit = array[2].to_s
        dose = Dose.new(quantity:quantity, unit:unit)
        dose.save!
        dose.recipe =  recipe
        dose.ingredient = ingredient
      elsif array[3]
        quantity = array[3].to_i
        dose = Dose.new(quantity:quantity)
        dose.save!
        dose.recipe =  recipe
        dose.ingredient = ingredient
      else
        quantity = operate(array[0])
        dose = Dose.new(quantity:quantity)
        dose.save!
        dose.recipe =  recipe
        dose.ingredient = ingredient
      end
    end
  end
end
end

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










#   cocktail.remote_photo_url = new_url


# # create_table :recipes do |t|
# #       t.string :name
# #       t.string :photo
# #       t.text :description
# #       t.time :string






# # url = "http://www.epicurious.com/search/chocolate?content=recipe"
# # html_file = open(url).read
# # html_doc = Nokogiri::HTML(html_file)

# # html_doc.search('.summary > a').each do |element|
# #   puts element.text
# # end



# def write_csv(ingredient)
#   recipes= []




# # require 'json'
# # require 'open-uri'

# # Cocktail.destroy_all
# # Ingredient.destroy_all

# # url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass"
# # user_serialized = open(url).read
# # user = JSON.parse(open(url).read)["drinks"].first(20)
# # user.each do |item|
# #   new_url = item['strDrinkThumb']
# #   cocktail = Cocktail.new(name: item["strDrink"])
# #   cocktail.remote_photo_url = new_url
# #   cocktail.save
# # end


# # ingredients = %w(lemon ice mint leaves redbull jagermeister sugar tonic gin rhum)
# # ingredients.each do |ingredient|
# #   Ingredient.create(name:ingredient)
# # end

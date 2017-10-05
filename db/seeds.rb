# require 'open-uri'
# require 'nokogiri'

# Recipe.destroy_all
# Ingredient.destroy_all

# doc = Nokogiri::HTML(open("https://www.jamieoliver.com/recipes/category/books/5-ingredients-quick-easy-food-recipes/"), nil, 'utf-8')
#   doc.search(".recipe-title")each do |recipe|
# doc = Nokogiri::HTML(open("https://www.jamieoliver.com/recipes/beef-recipes/#{recipe}/"), nil, 'utf-8')
#   doc.search("recipe-container")each do |item|

#     name = item.search('h1.hidden-xs').text
#     description = item.search('.method-p').text
#     cooking_time = item.search('.recipe-detail.time').text
#     serves = item.search('.recipe-detail-serves').text
#     Recipe.New(name, descriptionm cooking_time, calories)
#     dosedescription = scrapp
#     doseunit= scrapp
#     # diff = item.search('.m_detail_recette').text.split('-')
#     # difficulty = diff[2]
#     dose  = Dose.new(dosedescription,doseunit)
#     dose.recipe =  recipe
#     dose.ingredient = ingredient
#   end


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

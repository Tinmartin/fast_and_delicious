Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.



To-do list DAY 1 https://gist.githubusercontent.com/arrabatur/059bc2833433e0b142fda45d2e91e0da/raw/698ff0e596cf6ff4845441a148d625b46caf623c/gistfile1.txt

Fichiers à créer et à push dans le repo Github :
- Rails new project


Models :
[x] recette
  - has_many ingredients
[ ] ingredient
  - belongs_to recette
[ ] doses
[ ] user (devise)
[ ] review
[ ] profile

SEED
recipes < ingredients via les doses

Srcaping :
JammyOliver

API
- ingredients / recettes : à déterminer
Spoonacular : https://market.mashape.com/spoonacular/recipe-food-nutrition/pricing : 365,000 recipe, 86,000 food products.
✓ find recipes to use ingredients you already have ("what's in your fridge" search)
ACADEMIC ACCESS : Also, if you're taking part in a hackathon or use the API in a school project, let us know and we'll give you unlimited access during the event!


Controllers :

- recipes: index show

- profile: show, edit, update

- favorite : new, create, destroy
- reviews: new create destroy edit update


Photo management et stockage : Cloudinary ? AWS S3? (TBD)

Uploader: CarrierWave

Bots : Facebook Bot

Recherche intelligente : Algola - Search made powerful

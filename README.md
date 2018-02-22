# 5 Ingrédients - Recettes de cuisine ultra rapides et simples !

### Pitch:
Trouve facilement des recettes de cuisine, composées de seulement 5 ingrédients ! On a sélectionné de décilicueses recettes, simples et rapides. Et les ingrédients sont peu chers et aisément trouvable en supermarchés.
Il te reste des ingrédients dans le frigo et tu ne sais pas quoi faire avec ? Rentre les dans la barre de recherche, on te sort toutes les recettes que tu peux faire avec ! Miam Miam !!


### Models:
- recette
  has_many ingredients
- ingredient
  belongs_to recette
- doses
- user (devise)
- review ==> A SUPPRIMER
- profile

### Controllers:
- recipes: index show
- profile: show, edit, update
- favorite : new, create, destroy
- reviews: new create destroy edit update  ==> A SUPPRIMER

### Other stuff:
Photo management et stockage: Cloudinary
Uploader: CarrierWave
Recherche intelligente : Algola - Search made powerful


## TO DO - MVP Focus :

MOBILE FIRST
[ ] retirer le code inutile
[ ] nettoyer le CSS
[ ] réalisation Index Recettes
[ ] réalisation Show d'une Recette
[ ] creation navbar
  [ ] mettre logo Search
  [ ] mettre logo du site en PNG
  [ ] mettre logo Menu Hamburger
  [ ] Faire CSS de la navbar
  [ ] Relier le logo Search à une vraie Search Bar
  [ ] Relier le logo Menu à un vrai menu déroulant

DESKTOP:

[ ] réalisation Index Recettes
[ ] réalisation Show d'une Recette

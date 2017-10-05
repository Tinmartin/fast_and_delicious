Rails.application.routes.draw do
  get 'recipes/index'

  get 'recipes/show'

  devise_for :users
  resources :recipes, only: [ :index, :show ]
  root to: 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'recipes/index'

  get 'recipes/show'

  resources :recipes, only: [ :index, :show ]
  root to: 'recipes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

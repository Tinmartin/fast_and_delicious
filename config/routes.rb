Rails.application.routes.draw do

  resource :profile, :only => :show, :as => :current_profile
  resource :profile, only: [ :edit, :destroy ]


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :recipes, only: [ :index, :show ] do
<<<<<<< HEAD
    resource :favorite, only: %w(update destroy)
  end
=======
    collection do
      get 'search'
    end
end

  resources :ingredients
>>>>>>> 4c2609fabefab1d5779ea7fa90fa0d2731a42f89

  root to: 'recipes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

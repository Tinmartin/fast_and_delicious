Rails.application.routes.draw do

  resource :profile, :only => :show, :as => :current_profile, :type => :current_profile
  resource :profile, only: [ :edit, :destroy ]


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :recipes, only: [ :index, :show ]

  root to: 'recipes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

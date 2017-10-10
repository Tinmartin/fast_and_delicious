Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root to: 'recipes#index'
  resource :profile, :only => :show, :as => :current_profile
  resource :profile, only: [ :edit, :destroy, :update ]


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :recipes, only: [ :index, :show, :new, :create ] do
    resources :reviews, only: [ :new, :create]
    collection do
      get 'search'
    end
  end

  resources :doses, only: [ :new, :create, :destroy, :edit, :update ]

  resources :ingredients

  resources :reviews, only: [ :destroy ]


  resources :favorites, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




Rails.application.routes.draw do

  root to: 'recipes#index'
  resource :profile, :only => :show, :as => :current_profile
  resource :profile, only: [ :edit, :destroy ]


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :recipes, only: [ :index, :show ] do
   resources :doses, only: [ :new, :create ]
    collection do
      get 'search'
    end

end



      resources :doses, only: [ :destroy, :edit, :update]



  resources :ingredients


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



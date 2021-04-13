Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/faq', to: 'static_pages#faq'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  #sign up routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  #omniauth route
  match '/auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]

    controller :sessions do
      get 'login', to: 'sessions#new'
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
  end

  get '/profile', to: 'users#show'
  get 'qals/finished_quilts', :to => 'qals#finished_quilts'
  get 'qals/beginners', :to => 'qals#good_for_beginners'
  get 'qals/ending_soon', :to => 'qals#ending_soon'

  resources :users

#   nesting new prize form
  resources :qals do 
    resources :prizes, :only => [:create, :index, :new, :show]
  end

  resources :quilts
#   nestiing new quilt form
  resources :quilters do 
    resources :quilts, :only => [:create, :index, :new]
  end

  resources :sponsors 
  resources :prizes
end
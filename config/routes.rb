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

  resources :users
  resources :qals
  resources :prizes

  resources :quilts
  resources :quilters do 
    resources :quilts, :only => [:create, :index, :new]
  end

  resources :sponsors do 
    resources :prizes, :only => [:create, :index, :new]
  end
end
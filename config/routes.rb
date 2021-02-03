Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/faq', to: 'static_pages#faq'
  get '/about', to: 'static_pages#about'

  get 'sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'


end

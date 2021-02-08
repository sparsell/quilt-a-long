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

  controller :sessions do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end

  #log in routes
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'

  #logout
  # delete 'logout', to: 'sessions#destroy'



  # resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show, :index, :update]

  resources :qals, only: [:new, :create, :show, :index]
 

end

# use nested routes to better express the relationship between models:
# class Post < ActiveRecord::Base
#   has_many :comments
# end

# class Comment < ActiveRecord::Base
#   belongs_to :post
# end

# # routes.rb
# resources :posts do
#   resources :comments
# end
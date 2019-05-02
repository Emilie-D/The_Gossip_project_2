Rails.application.routes.draw do

get '/signup', to: 'user#new'
post '/user', to: 'user#create'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
root 'gossip#index'
get '/home/team', to: 'home#team'
get '/home/contact', to: 'home#contact'
get '/home/:id', to: 'user#welcome'
post '/home/contact', to: 'home#contact'
resources :gossip
resources :user
resources :city, only: [:show]
resources :comment

end

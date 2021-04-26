Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # HTTP-METHOD '/path', to: 'controller#action'
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create' 
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  # /users/10/chirps => display the chirp index for the user with id of 10

  # resources :users #gives us all restful routes
  # resources :users, only: [:index, :show, :create, :update, :destroy] gives us only the restful routes in the array

  resources :users do # all restful routes except the onlys in the array  resources
    resources :chirps, only: [:index] # we want a chirp index for each specific user
  end
  resources :chirps, only: :show #you can do no array with a single argument

  resource :session, only: [:new, :create, :destroy]
  # sessions are singular: only one login at a time

end

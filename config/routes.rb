SimpleLogin::Application.routes.draw do
  root 'users#new'

  resources :users            #use all users RESTful routes
  resources :sessions, :only => [:new, :create, :destroy] #only need 3 restful routes for Sessions
  resources :messages, :only => [:new, :create]
  resources :comments, :only => [:new, :create]

  get "/signup"               => 'users#new'
  get "/signin"               => 'sessions#new'
  get "/signout"              => 'sessions#destroy'

end

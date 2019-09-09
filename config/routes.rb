Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  get "/" => "main#index"


  # log in page with form:

  # get "/admins/login" => "admins#login"
  # get '/login' => 'sessions#new'

  # create (post) action for when log in form is submitted:
  # post '/login' => 'sessions#create'

  # delete action to log out:

  get 'signup', to: 'admins#new', as: 'signup'
  
  get 'login', to: 'sessions#new', as: 'login'

  post 'login', to: 'admins#cms', as: 'cms'

  get 'logout', to: 'sessions#destroy', as: 'logout'


  delete '/logout' => 'sessions#destroy' 


  resources :admins, :sessions, only: [:new, :create, :destroy]
  
end

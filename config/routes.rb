Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html



  #rotas do CRUD usuarios 
  # Rotas do CRUD usuários
  resources :users, only: [:index, :create, :new, :edit, :update, :destroy] # Para registro e para acessar o formulário
  post 'login', to: 'sessions#create' # Para login
  delete 'logout', to: 'sessions#destroy' # Para logout


  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

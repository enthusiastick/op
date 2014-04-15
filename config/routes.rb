Rails.application.routes.draw do

  root 'pages#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/auth/:provider/callback', to: 'sessions#create'

end

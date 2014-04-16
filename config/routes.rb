Rails.application.routes.draw do

  root 'pages#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  get 'sign_in', to: 'pages#signin'

  get '/auth/:provider/callback', to: 'users#new'

end

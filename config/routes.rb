Rails.application.routes.draw do

  root 'pages#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  get 'sendgrid', to: 'pages#sendgrid'

  get 'sign_in', to: 'pages#signin'
  get 'sign_out', to: 'users#signout'

  get 'chat', to: 'pages#chat'

  get '/auth/:provider/callback', to: 'users#new'

  get '/discourse/sso', to: 'discourse_sso#sso'

end

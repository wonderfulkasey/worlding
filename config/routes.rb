Rails.application.routes.draw do

  #dynamic error pages
  #get 'errors/not_found'
  #get 'errors/internal_server_error'

  #match "/404", :to => "errors#not_found", :via => :all
  #match "/500", :to => "errors#internal_server_error", :via => :all

  #home page
  root 'application#home'

  #
  resources :application

  resources :worlds do
    resources :plots
    resources :characters
  end

  resources :plots
  resources :characters

  #personal index
  get '/my-worlds' => 'worlds#profile'

  #other profiles
  get '/:user_id' => 'worlds#others'

  #view world with most plots 
  get 'worlds/most-plots' => 'worlds#show'

  #
  devise_for :users, controllers: {registrations: "registrations", 
    omniauth_callbacks: "callbacks"}

  devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do 
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

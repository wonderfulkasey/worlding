Rails.application.routes.draw do

  root 'welcomes#home'

  #
  resources :welcomes

  resources :worlds do
    resources :plots, :characters
  end

  resources :plots
  resources :characters

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

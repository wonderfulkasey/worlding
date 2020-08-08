Rails.application.routes.draw do

  #dynamic error pages
  get "/404", to: "errors#not_found", :defaults => { :format => 'html' }
  get "/500", to: "errors#internal_error", :defaults => { :format => 'html' }

  root 'application#home'

  #
  resources :worlds do
    resources :plots, :characters
  end

  resources :plots
  resources :characters

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

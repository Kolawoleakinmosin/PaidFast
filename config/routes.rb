Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "/qr-code", to: "pages#qr_generator"
  get "/playground", to: "pages#playground"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :transactions, only: %i[create new index show] do
    member do
      get "confirmation", to: "transactions#confirmation"
    end
  end
end

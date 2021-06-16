Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/forecast", to: 'forecast#index'
      get "/backgrounds", to: 'backgrounds#index'
      get "/book-search", to: 'books#index'
      post "/users", to: 'users#create'
      post "/sessions", to: 'sessions#create'
    end
  end
end

Rails.application.routes.draw do
  # this is just a comment to refresh the PR
  namespace :api do
    namespace :v1 do
      get "/forecast", to: 'forecast#index'
    end
  end
end

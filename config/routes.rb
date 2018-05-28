Rails.application.routes.draw do
  # Route for api -> v1 -> gps
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #devise_for :users
      resources :gps, :only => [:show, :create, :update, :destroy]
    end
  end 
  # Route for controller gps
  resources :gps
  root to: 'gps#index' 
end
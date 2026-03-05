Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      post "signup", to: "auth#signup"
      post "login", to: "auth#login"
      resources :products
      resources :orders
      get "total_count", to: "orders#get_total_count"
    end
  end

end

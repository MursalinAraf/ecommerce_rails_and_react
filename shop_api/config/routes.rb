Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      post "signup", to: "auth#signup"
      post "login", to: "auth#login"
      post "refresh", to: "auth#refresh"
      resources :products
    end
  end

end

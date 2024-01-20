Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #

  namespace :api do
    namespace :v1 do
      resources :recipes do
        get "ingredients" => "recipes#ingredients"
        post "add_to_shopping_list" => "recipes#add_to_shopping_list"

        collection do
          get "select_random" => "recipes#select_random"
        end
      end

      resources :shopping_lists
      resources :users do
        post "create_shopping_list" => "users#create_shopping_list"
      end
    end
  end
end

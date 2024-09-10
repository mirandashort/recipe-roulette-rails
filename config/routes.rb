Rails.application.routes.draw do
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

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
        put "check_item" => "users#check_item"
        put "uncheck_item" => "users#uncheck_item"

      end
    end
  end
end

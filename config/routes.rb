Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :users, only: [:create]
  post "/login", to: "users#login"
  
  namespace "api" do
    resources :products do
      collection do
        get 'get_by_name'
      end
    end
    resources :categories
  end
end

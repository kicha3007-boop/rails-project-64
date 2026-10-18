Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root "posts#index"

  resources :posts, only: %i[index show new create] do
    scope module: :posts do
      resources :comments, only: :create
      resources :likes, only: %i[create destroy]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :furnitures do
    collection do
      get :my_furniture
    end
    resources :offers, only: %i[new create]
  end

  resources :offers, only: %i[index show edit update destroy] do
    get :my_offers
  end
end

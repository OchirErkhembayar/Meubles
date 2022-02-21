Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :furnitures do
    resources :offers, only: %i[new create]
  end
  get '/my_furnitures', to: "furnitures#my_furnitures"

  resources :offers, only: %i[index show edit update destroy]
  get '/my_offers', to: "offers#my_offers"
end

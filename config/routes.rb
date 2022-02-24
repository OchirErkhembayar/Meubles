Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :furnitures do
    resources :offers, only: %i[new create]
  end
  get '/my_furnitures', to: "furnitures#my_furnitures"

  resources :offers, only: %i[index show edit update] do
    member do
      put :accept
      delete :destroy
      put :paid
    end
  end

<<<<<<< HEAD
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :users, only: %i[show edit update]
=======
  resources :users, only: %i[show edit update] do
    resources :reviews, only: %i[new create]
  end

  resources :reviews, only: %i[destroy]
>>>>>>> 26e595c4d86009f0ae06dca1cdfca6d2921c1785
end

Rails.application.routes.draw do
  get 'search', to: 'search#index'
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
end

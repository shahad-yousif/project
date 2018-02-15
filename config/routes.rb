Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions'}
  resources :people
  root 'people#index'
  resources :profiles do
    member do
      post 'change_status'
    end
  end
  resources :addresses
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
      }
  resources :people
  root 'people#index'
  resources :profiles do
    member do
      post 'change_status'
    end
  end
  resources :addresses
end

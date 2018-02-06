Rails.application.routes.draw do
  resources :people
  root 'people#index'
  resources :profiles do
    member do
      post 'change_status'
    end
  end
  resources :addresses
end

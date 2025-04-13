Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :candidates do
    resources :submissions, only: [:show, :new, :create, :destroy]
    resources :interviews, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :offers, only: [:show, :new, :create, :destroy]
    resources :placements, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :clients
  resources :client_contacts
  resources :jobs do
    resources :submissions, only: [:show, :new, :create, :destroy]
    resources :interviews, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :offers, only: [:show, :new, :create, :destroy]
    resources :placements, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :submissions, only: [:index, :show, :destroy]
  resources :interviews, only: [:index, :show, :edit, :update, :destroy]
  resources :offers, only: [:index, :show, :destroy]
  resources :placements

end

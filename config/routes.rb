Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vans do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy update index]
  get 'received-bookings', to: 'bookings#received_bookings'
end

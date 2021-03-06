Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#index'
  resources :authorized_clients
  get 'set_cookie_client_secret/:id', to: 'authorized_clients#set_cookie_client_secret', as: :set_cookie
  resources :attendance
  post 'new_attendance', to: 'attendance#attend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :units
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#index'
  get 'homepage', to: 'pages#homepage', as: 'homepage'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'user_table', to: 'pages#user_table', as: 'user_table'
  get 'user_details', to: 'pages#user_details', as: 'user_details'



  resources :bookings
  get 'request_message', to:'bookings#request_message', as:'request_message'
  post 'create_booking', to: 'bookings#create', as:'create_booking'
  put 'approve_booking/:id', to:'bookings#approve', as:'approve_booking'
  put 'deny_booking/:id', to:'bookings#deny', as:'deny_booking'
  put 'cancel_booking/:id', to:'bookings#cancel', as:'cancel_booking'
  # put 'bookings/:id', to:'bookings#index', as:'bookings'



  get 'show_state', to: 'users#show_state', as: 'show_state'
  get 'bio', to:'users#bio', as:'bio'


  #Devise routes for logging in, registrations
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end




end

Rails.application.routes.draw do
  resources :units
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
  get 'homepage', to: 'pages#homepage', as: 'homepage'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'user_details', to: 'pages#user_details', as: 'user_details'
  get 'calendar_legend', to:'pages#calendar_legend', as: 'calendar_legend'

  get '/redirect', to: 'events#redirect', as: 'redirect'
  get '/callback', to: 'events#callback', as: 'callback'
  get '/calendar', to: 'events#calendar', as: 'calendar'
  get '/events/:calendar_id', to: 'events#events', as: 'events', calendar_id: /[^\/]+/


  resources :bookings
  get 'booking_table', to:'bookings#booking_table', as:'booking_table'
  get 'request_message', to:'bookings#request_message', as:'request_message'
  post 'create_booking', to: 'bookings#create', as:'create_booking'
  put 'approve_booking/:id', to:'bookings#approve', as:'approve_booking'
  put 'deny_booking/:id', to:'bookings#deny', as:'deny_booking'
  put 'cancel_booking/:id', to:'bookings#cancel', as:'cancel_booking'
  post '/events/:calendar_id', to: 'bookings#new_event', as: 'new_event', calendar_id: /[^\/]+/
  # post 'destroy_bookings_and_events', to:'bookings#destroy_bookings_and_events', as: 'destroy_bookings_and_events'

  post 'delete_calendar', to:'units#delete_calendar', as:'delete_calendar'

  post 'twilio/sms'


  get 'bio', to:'users#bio', as:'bio'
  get 'user_table', to: 'users#index', as: 'user_table'


  #Devise routes for logging in, registrations
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#delete', as:'get_destroy_user_session'
  end




end

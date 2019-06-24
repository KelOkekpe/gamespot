Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Pages
  root to: 'pages#index'

  # get route to homepage
  get 'homepage', to: 'pages#homepage', as: 'homepage'
  # get route to dashboard page
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'



  #Trial card routes
  put 'extend_trial', to: 'pages#extend_trial', as: 'extend_trial'
  put 'pause_trial', to: 'pages#pause_trial', as: 'pause_trial'
  put 'unpause_trial', to: 'pages#unpause_trial', as: 'unpause_trial'
  put 'suspend', to:'pages#suspend', as:'suspend'
  put 'activate', to:'pages#activate', as:'activate'



  get 'request_message', to:'bookings#request_message', as:'request_message'
  post 'create_booking', to: 'bookings#create', as:'create_booking'
  put 'approve_booking/:id', to:'bookings#approve', as:'approve_booking'
  put 'deny_booking/:id', to:'bookings#deny', as:'deny_booking'

  resources :bookings



  get 'bio', to:'users#bio', as:'bio'


  # get route to main_feed posts page
  get 'main_feed', to: 'pages#main_feed', as: 'main_feed'
  # get route to new posts page
  get 'new_post', to: 'pages#new_post', as: 'new_post'
  post 'create', to: 'post#create', as: 'create_post'

  #user routes
  get 'user_table', to: 'pages#user_table', as: 'user_table'
  get 'user_details', to: 'pages#user_details', as: 'user_details'

  get 'show_state', to: 'users#show_state', as: 'show_state'

  #Devise routes for logging in, registrations
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  




  resources :posts do
    collection do
      get 'sports'
      get 'games'
      get 'music'
    end
  end


end

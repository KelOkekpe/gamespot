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



  # get route to main_feed posts page
  get 'main_feed', to: 'pages#main_feed', as: 'main_feed'

  # get route to new posts page
  get 'new_post', to: 'pages#new_post', as: 'new_post'
  post 'create', to: 'post#create', as: 'create_post'

  #user routes
  get 'user_table', to: 'pages#user_table', as: 'user_table'

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

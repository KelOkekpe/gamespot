Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Pages
  root to: 'pages#index'

  # get route to homepage
  get 'homepage', to: 'pages#homepage', as: 'homepage'
  # get route to dashboard page
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  put 'extend_trial', to: 'pages#extend_trial', as: 'extend_trial'

  # get route to main_feed posts page
  get 'main_feed', to: 'pages#main_feed', as: 'main_feed'
  # get route to new posts page
  get 'new_post', to: 'pages#new_post', as: 'new_post'


  #Devise routes for logging in, registration
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

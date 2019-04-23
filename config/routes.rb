Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/pages/main_feed', to: 'pages#main_feed', as: 'main_feed'

  get '/layouts/new_post', to: 'pages#new_post', as: 'new_post'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#create'
  end


  resources :posts do
    collection do
      get 'sports'
      get 'games'
      get 'music'
    end
  end


end

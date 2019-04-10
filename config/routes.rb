Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#create'
  end

  
  # devise_for :users, :controllers => {:registrations => "registrations"}
end

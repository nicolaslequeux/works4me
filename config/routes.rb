Rails.application.routes.draw do

  root to: 'pages#home'

  get '/faq', to: 'pages#faq', as: 'faq'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'

  get '/profile', to: 'pages#profile', as: 'profile'

  get '/my_tasks', to: 'tasks#my_tasks', as: 'my_tasks'

  devise_for :users

  resources :tasks do
    resources :reviews, only: [:new, :create]
    resources :payments, only: [:new, :show, :create, :update]
  end
end

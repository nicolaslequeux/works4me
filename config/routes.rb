Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/faq', to: 'pages#faq', as: 'faq'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'

  get '/profile', to: 'pages#profile', as: 'profile'
  get '/tasks/:id/worker_profile', to: 'pages#worker_profile', as: 'worker_profile'

  get '/my_tasks', to: 'tasks#my_tasks', as: 'my_tasks'
  get '/my_jobs', to: 'tasks#my_jobs', as: 'my_jobs'

  # devise_for :users


  resources :tasks do
    resources :reviews, only: [:new, :create]
    resources :payments, only: [:new, :show, :create, :update]
  end
end

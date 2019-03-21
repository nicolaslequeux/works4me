Rails.application.routes.draw do
  root to: 'pages#home'
  get '/faq', to: 'pages#faq', as: 'faq'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :reviews, only: [:new, :create]
    resources :payments, only: [:new, :show, :create, :update]
  end
end

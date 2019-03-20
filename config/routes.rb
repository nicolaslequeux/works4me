Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews, only: [:index, :show]
  resources :tasks do
    resources :reviews, only: [:new, :create]
  end
end

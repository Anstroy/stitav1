Rails.application.routes.draw do
  resources :awards
  resources :educations
  resources :skills
  resources :experiences
  resources :positions
  resources :members
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
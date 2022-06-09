Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'info', to: 'pages#info'
  resources :dogs
  resources :swipes, only: %i[create index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :dogs
  get 'swipes/new'
  get 'swipes/create'
  get 'swipes/index'
  get 'swipes/show'
#  resources :swipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

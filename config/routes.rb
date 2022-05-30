Rails.application.routes.draw do
  get 'dogs/new'
  get 'dogs/create'
  get 'dogs/update'
  get 'dogs/edit'
  get 'dogs/index'
  get 'dogs/show'
  devise_for :users
  root to: 'pages#home'
  resources :dogs do
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

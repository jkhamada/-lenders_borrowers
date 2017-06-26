Rails.application.routes.draw do
  root 'borrowers#new'
  # get 'borrowers/new'

  # get 'borrowers/create'
  #
  # get 'borrowers/show'
  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post "/lend" => "lenders#lend"
  resources :lenders
  resources :borrowers, exclude: [:index], via: [:get, :post]
  resources :sessions

  resources :historys

end

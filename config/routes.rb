Rails.application.routes.draw do
  root 'books#index'

  resources :books

  resources :admins

  
  # get 'admins/index' => 'admins#index', as: 'index_admins', via: :all
  # get 'admins/new' => 'admins#new', as: 'new_admins', via: [:post, :get]
  get 'admins/login' => 'admins#login', as: 'login_admins', via: [:post, :get]

end

Rails.application.routes.draw do
  get 'sessions/new'

  root 'books#index'

  get 'signup' => 'admins#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :books

  resources :admins


  # get 'admins/index' => 'admins#index', as: 'index_admins', via: :all
  # get 'admins/new' => 'admins#new', as: 'new_admins', via: [:post, :get]
  get 'admins/login' => 'admins#login', as: 'login_admins', via: [:post, :get]

end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'surfboards/search'
  get 'surfboards/not_found'
  # get 'bookings/requests
  get 'bookings/bookings_requests'

  resources :surfboards do
    resources :bookings, only: [:new, :create]
    collection do
      get :my_surfboards
    end
  end
  #root to: 'surfboards#index'

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    collection do
      get :my_bookings
    end
  end
end
#root :to=>"demo#index"
#get 'demo/index'
#get 'demo/hello'
#get 'demo/other_hello'
#resources :subjects
#get 'subjects/list' => 'subjects#list'
#get 'subjects/list' => 'subjects#show'
#get 'subjects/create' => 'subjects#create'
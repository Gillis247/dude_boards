Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'surfboards/search'
  get 'surfboards/not_found'
  # get 'bookings/requests
  get 'bookings/bookings_requests'
  get  'surfboards/gotcha'

  resources :surfboards do
    resources :bookings, only: [:new, :create]
    collection do
      get :my_surfboards
    end
  end


  resources :bookings, only: [:show, :edit, :update, :destroy] do
    collection do
      get :my_bookings
    end
  end
end

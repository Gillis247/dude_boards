Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :surfboards do 
    resources :bookings 
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
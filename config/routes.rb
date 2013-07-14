BathroomStall::Application.routes.draw do
  resources :victims do
  	resources :comments
  end
  resources :users, :only => [:index, :show, :edit, :update ]

  root :to => "home#index"

  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end

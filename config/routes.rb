Gooutfit::Application.routes.draw do
  devise_for :users, controllers: { :registrations => 'registrations', :sessions => 'sessions' }
  devise_scope :user do
    match "/profile/edit", :to => "users#edit", :as => "edit_profile"
    match "/signup" => "registrations#new", :as => :signup
    match "/login" => "sessions#new", :as => :signin
    match "/logout" => "sessions#destroy", :as => :signout
  end

  root to: "battles#index"

  resources :users

  resources :outfits
  resources :battles

  resources :authentications, only: [:create, :destroy]

  match '/auth/:provider/callback' => 'authentications#create'
end

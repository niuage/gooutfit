Gooutfit::Application.routes.draw do
  devise_for :users

  root to: "battles#index"

  resources :outfits
  resources :battles
end

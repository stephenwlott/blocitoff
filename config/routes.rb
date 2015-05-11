Rails.application.routes.draw do
  get 'items/new'

  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:new, :create, :destroy]
  end
  
  get 'welcome/home'
  get 'welcome/about'

  authenticated :user do
    root to: "users#show", :as => "profile", :as => "item"
  end
  root to: 'welcome#home'
end

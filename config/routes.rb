Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  
  get 'welcome/home'

  get 'welcome/about'

  authenticated :user do
    root to: "users#show", :as => "profile"
  end
  root to: 'welcome#home'
end

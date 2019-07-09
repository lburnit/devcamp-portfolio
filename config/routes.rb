Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end   
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'get-motivated', to: 'pages#get_motivated'

  get 'my-story', to: 'storys#my_story'


  get "search", to: "searches#index"
  
  
  resources :blogs do 
    member do
      get :toggle_status
    end 
  end   

  resources :comments, only: [:new, :create] do 
    member do
      get :reply
      get 'like', to: "comments#like"
      get 'unlike', to: "comments#unlike"
      delete 'destroy', to: "comments#destroy"
      put 'update-my', to: "comments#update_comment"
      patch 'edit', to: "comments#edit"
      get 'discussion', to: "comments#discussion"
    end
  end  
  
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end

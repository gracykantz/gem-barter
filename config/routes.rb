Rails.application.routes.draw do
  get 'categories/index'
  get 'myprofile', to: 'pages#myprofile', as: :myprofile
  devise_for :users
  root to: 'pages#home'
  resources:categories do # Added categories as parent for Furniture Items
    resources :furniture_items, except: [:new, :create, :edit, :update] do
    resources :swipes, except: :destroy  #only: [:index, :new, :create, :edit, :update]
    # resource :images
    end
  end
  resources :furniture_items, only: [:new, :create, :edit, :update]
  get 'messages/index'
  resource :messages, only: [:show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

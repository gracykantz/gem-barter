Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  get 'pages/home', to: 'pages#home'
  root to: 'pages#home'
  resources :furniture_items do
    resources :swipes, except: :destroy  #only: [:index, :new, :create, :edit, :update]
    # resource :images
  end
  get 'messages/index'
  resource :messages, only: [:show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

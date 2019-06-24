Rails.application.routes.draw do
  get 'categories/index'
  get 'myprofile', to: 'pages#myprofile', as: :myprofile
  get 'mark_traded', to: 'furniture_items#mark_traded', as: :traded
  devise_for :users
  post 'update_swipes', to: 'furniture_items#update_swipes', as: :swiped
  root to: 'pages#home'
  resources:categories do # Added categories as parent for Furniture Items
    resources :furniture_items, except: [:new, :create, :edit, :update] do
    resources :swipes, except: :destroy  #only: [:index, :new, :create, :edit, :update]
    # resource :images
  end
end
  resources :furniture_items, only: [:new, :create, :edit, :update]
  get 'messages/index'
  resources :chat_rooms, only: [:show] do
    resource :messages, only: [:show, :new, :create]
  end

  get 'noshow', to: 'chat_rooms#no_show', as: :noshow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

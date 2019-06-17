Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :furniture_items do
    resources :swipes, except: :destroy  #only: [:index, :new, :create, :edit, :update]
    # resource :images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

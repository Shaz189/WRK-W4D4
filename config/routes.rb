Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index, :update, :destroy]
  resource :session, except: [:index, :show, :update, :edit]
  resources :bands do 
    resources :albums, only: [:new, :create]
  end
  resources :albums, except: [:index] do 
    resources :tracks, only: [:new, :create]
  end
  resources :tracks, except: [:index]
  root 'bands#index'
end

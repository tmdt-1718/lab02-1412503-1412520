Rails.application.routes.draw do
  get 'session/login', to: 'session#new', as: :login
  post 'session/login', to: 'session#create', as: nil
  delete 'session/logout', to: 'session#destroy', as: :logout



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	scope '/messages' do
	  resources :inbox, :sent, only: [:index]
	  post 'inbox/read', to: 'inbox#read'
    resources :new_mes, only: [:index, :create]
	end

  resources :friend, only: [:index, :create, :destroy]

  resources :user, only: [:create, :index]
end

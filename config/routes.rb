Rails.application.routes.draw do
  get 'session/login', to: 'session#new', as: :login
  post 'session/login', to: 'session#create', as: nil
  delete 'session/logout', to: 'session#destroy', as: :logout

  get  'new_mes', to: 'new_mes#index', as: nil
  post 'new_mes', to: 'new_mes#create', as: nil

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	scope '/messages' do
	  resources :inbox, :sent, only: [:index]
	  post 'inbox/read', to: 'inbox#read'
	end
  # resources :messages, only: [:index]
  resources :user, only: [:new, :create]

  resources :new_mes, only: [:index, :create]
  # resources :session, only: [:new, :create, :destroy as: nil]
end

Rails.application.routes.draw do
  get 'session/login', to: 'session#new', as: :login
  post 'session/login', to: 'session#create', as: nil
  delete 'session/logout', to: 'session#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	scope '/messages' do
	  resources :inbox, :sent, only: [:index]
	  post 'inbox/read', to: 'inbox#read'
	end
  # resources :messages, only: [:index]
  resources :user, only: [:new, :create]
  # resources :session, only: [:new, :create, :destroy as: nil]
end

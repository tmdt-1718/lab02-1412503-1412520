Rails.application.routes.draw do
  get '/', to: 'home#index'

  get '/about', to: 'home#about'

  get 'session/login', to: 'session#new', as: :login
  post 'session/login', to: 'session#create', as: nil
  delete 'session/logout', to: 'session#destroy', as: :logout



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	scope '/messages' do
	  resources :inbox, :sent_mes, only: [:index]
	  post 'inbox/read', to: 'inbox#read'
    get 'sent_mes/get_recipient', to: 'sent_mes#get_recipient'
    resources :new_mes, only: [:index, :create]
	end

  resources :friend, only: [:index, :create, :destroy]

  resources :user, only: [:create, :index]
end

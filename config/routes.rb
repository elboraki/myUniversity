Rails.application.routes.draw do
  root 'courses#index'
  get '/about', to: 'pages#about'
  resources :students, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  delete '/logout', to: 'logins#destroy'
end

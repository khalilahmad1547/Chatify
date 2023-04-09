namespace :api do
  namespace :v0 do
    post '/login', to: 'authentication#login'

    resources :users, except: [:index]
  end
end

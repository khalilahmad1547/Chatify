namespace :api do
  namespace :v0 do
    resources :users, except: [:index]
  end
end

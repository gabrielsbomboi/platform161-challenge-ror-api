Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/banners', to: 'banners#index'
      post '/banners', to: 'banners#create'
      get '/banners/:id', to: 'banners#show'
      put '/banners/:id', to: 'banners#update'
      delete '/banners/:id', to: 'banners#destroy'
      get '/campaigns', to: 'campaigns#index'
      post '/campaigns', to: 'campaigns#create'
      get '/campaigns/:id', to: 'campaigns#show'
      put '/campaigns/:id', to: 'campaigns#update'
      delete '/campaigns/:id', to: 'campaigns#destroy'

      # resources :banners, param: :id
    end
  end
end

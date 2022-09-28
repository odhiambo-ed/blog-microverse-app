Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :users
      resources :comments
      resources :likes

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      get '/users/:id/posts', to: 'users#posts'
      get '/users/:id/comments', to: 'users#comments'
      get '/users/:id/likes', to: 'users#likes'

      get '/posts/:id/comments', to: 'posts#comments'
      get '/posts/:id/likes', to: 'posts#likes'

      post '/posts/:id/like', to: 'posts#like'

      post '/posts/:id/comment', to: 'posts#comment'
      post '/users/:id/comment', to: 'users#comment'
      end
    end
end
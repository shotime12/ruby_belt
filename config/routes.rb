Rails.application.routes.draw do
  get '/songs/:id' => 'songs#show'

  get '/songs' => 'songs#index'  

  post '/add_song' => 'songs#add'



  get '/' => 'users#index' 

  post '/login' => 'users#login'

  post '/register' => 'users#register'

  get '/add_to_playlist/:id' => 'songs#add_to_playlist'

  get '/logout' => 'users#logout'

  get '/users/:id' => 'users#show'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

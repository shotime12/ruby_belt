Rails.application.routes.draw do
  get '/' => 'users#index' 

  post '/login' => 'users#login'

  post '/register' => 'users#register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

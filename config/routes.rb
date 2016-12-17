Rails.application.routes.draw do
  resources :welcome
  resources :reviews
  resources :users
  resources :user_portfolios
  resources :advisors
  resources :portfolios do
    resources :reviews
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/users/:id/add_user_info' => "user#add_user_info"
  post 'portfolios/upload', to: 'portfolios#upload'
  post 'user_portfolios/add_portfolio' => 'user_portfolios#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

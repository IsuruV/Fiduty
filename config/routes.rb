Rails.application.routes.draw do
  resources :user_portfolios
  resources :advisors
  resources :portfolios
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/users/:id/add_user_info' => "user#add_user_info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

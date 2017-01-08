Rails.application.routes.draw do
  get '/portfolios/etf_return' => 'portfolios#etf_return'
  resources :welcome
  resources :reviews
  resources :users
  resources :user_portfolios
  resources :advisors
  resources :portfolios do
    resources :reviews
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  post 'portfolios/upload', to: 'portfolios#upload'
  post 'user_portfolios/add_portfolio' => 'user_portfolios#create'
  post '/portfolios/portfolios_by_type' => 'portfolios#portfolios_by_type'
  post '/users/:id/add_user_info' => 'users#add_user_info'
  get '/portfolios/fetch_stock_quote' => 'portfolios#fetch_stock_quote'

  get '/portfolios/real_time_quotes' => 'portfolios#real_time_quotes'
  get '/user_portfolios/recent_investments' => 'user_portfolios#recent_investments'
  get '/users/:id/user_portfolios' => 'users#user_portfolios'
  
  post '/users/recent_friend_investment' => 'users#recent_friend_investment'
  get 'users/everyone_investment' => 'users#everyone_investment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

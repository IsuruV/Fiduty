Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'home#index'
  get '/home' => "home#home"
  
  get '/home/index' => 'home#index'
  get '/users/profile' => 'users#profile'
  get '/users/dashboard' => 'users#dashboard'
  get '/users/experience' => 'users#experience'
  get '/users/knowledge'=> 'users#knowledge'
  get '/users/social' => 'users#social'
  post '/users/social' => 'users#social'
  get '/portfolios/etf_return' => 'portfolios#etf_return'
  get '/users/recent_everyone_investment' => 'users#recent_everyone_investment'
  get '/users/sign_out' => "users#log_out"
  
  # devise_scope :user do
  #   get '/signout', to: 'devise/sessions#destroy', as: :signout
  # end
  namespace :api do
  # resources :reviews
  resources :users
  resources :user_portfolios
  resources :advisors
  resources :sales
  resources :portfolios do
    resources :reviews
  end

  
  # resources :tasks
  post '/tasks/complete_task' => 'tasks#complete_task'
  get '/tasks/user_tasks' => 'tasks#users_tasks'
  
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/portfolios/upload', to: 'portfolios#upload'
  post '/user_portfolios/add_portfolio' => 'user_portfolios#create'
  post '/portfolios/portfolios_by_type' => 'portfolios#portfolios_by_type'
  post '/users/:id/add_user_info' => 'users#add_user_info'
  get '/portfolios/fetch_stock_quote' => 'portfolios#fetch_stock_quote'

  get '/portfolios/real_time_quotes' => 'portfolios#real_time_quotes'
  get '/user_portfolios/recent_investments' => 'user_portfolios#recent_investments'
  get '/users/:id/user_portfolios' => 'users#user_portfolios'

  post '/users/recent_friend_investment' => 'users#recent_friend_investment'
  post '/users/friends_top_roi' => 'users#friends_roi'
  
  post '/users/:id/add_funds' => 'users#add_funds'
  
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


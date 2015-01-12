Rails.application.routes.draw do
  root 'search#index'
  get  "/search" => "search#index"
  get  "/search/autocomplete" => "search#autocomplete"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'login', to: redirect("/auth/github")
  get 'logout', to: 'sessions#destroy'

  resources :sessions
  resources :users
  resources :recommendations
  resources :terms

  match '404', to: 'application#not_found', via: :all
  match ':status', to: 'application#server_error', constraints: { status: /\d{3}/ }, via: :all
end

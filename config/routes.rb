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
  resources :recommendations, except: :show
  resources :terms

  match ":status", to: 'application#server_error', constraints: { status: /5\d{2}/ }, via: :all
  match '*path', via: :all, to: 'application#not_found'
end

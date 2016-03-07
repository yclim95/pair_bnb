Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, only: [:show, :edit, :update, :destroy] 

  #Clearance
  get "/sign_in" => "session_clearances#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  post "sign_in" => "session_clearances#create"
  post "/sign_up" => "users#create", as: "user_sign_up"


  #home
  get "/about" => "homes#about", as: "about"
  get "/contact_us" => "homes#contact", as: "contact"

  #users
  get '/users' => "users#index"
 
  resources :homes
  root 'homes#cover'

  # OmniAuth Facebook
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # Redirect to root if page not FOUND
  get ':not_found', to: redirect('/') 
end

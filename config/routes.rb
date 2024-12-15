Rails.application.routes.draw do
  # Session routes for login/logout
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # User registration route
  get "signup", to: "users#new"
  post "signup", to: "users#create"


  # Event and attendee routes
  resources :events do
    resources :attendees, only: [ :new, :create, :edit, :update, :destroy ]
  end

  root "sessions#new"  # Set login as the root route
end

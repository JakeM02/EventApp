Rails.application.routes.draw do
  resources :events do
    resources :attendees, only: [ :new, :create, :edit, :update, :destroy ]
  end

  root "events#index"  # Set events#index as the root route
end

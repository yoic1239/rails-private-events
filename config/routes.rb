Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :show ]
  resources :events, only: [ :index, :new, :create, :show ] do
    post "/attendance", to: "event_attendances#create"
  end

  root "events#index"
end

Rails.application.routes.draw do
  resources :users
  # resources :registrations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "events#index"

  # get "events" => "events#index", as: :events
  # get "events/new" => "events#new", as: :new_event
  # get "events/:id" => "events#show", as: :event
  # get "events/:id/edit" => "events#edit", as: :edit_event
  # patch "events/:id" => "events#update"
  # post "events/" => "events#create"
  # delete "events/:id" => "events#destroy"
  # # Defines the root path route ("/")
  # root "posts#index"

  resources :events do
    resources :registrations, only: %i[index new create]
  end
end

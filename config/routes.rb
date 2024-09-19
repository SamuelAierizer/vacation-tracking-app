Rails.application.routes.draw do
  resources :departments
  resources :vacation_requests do
    patch "update_status"
  end
  post "sync_users", to: "users#sync"
  resources :users
  get "dashboard/index"
  get "dashboard/admin"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "dashboard#index"
end

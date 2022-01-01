Rails.application.routes.draw do
  resources :journals
  root "home#index"
end

Rails.application.routes.draw do
  devise_for :users
  # devise_for :users do
  #   get "/users/sign_out" => "devise/sessions#destroy"
  # end
  resources :journals
  root "home#index"
end

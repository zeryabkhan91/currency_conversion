Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  post '/convert_to_cents', to: 'application#convert_to_cents'
end

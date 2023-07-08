Rails.application.routes.draw do
  get '/welcome', to: 'pages#welcome'
  root 'pages#welcome'  # Optional: Set the welcome action as the root path
end

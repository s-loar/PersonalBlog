Rails.application.routes.draw do
  resources :blogs
  root to: 'pages#home'
  get 'about', to: 'pages#about'
end

Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, path: "", path_names: {
      sign_in: "login",
      sign_out: "logout",
      sign_up: "register"
  }
  resources :blogs do
    resources :comments, only: [:create]
    member do
      get :get_comments
    end
  end
end

Rails.application.routes.draw do
  get :token, controller: 'application'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :projects  
      resources :tasks
      resources :comments
      resources :users
    end
  end
end

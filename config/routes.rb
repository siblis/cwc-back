Rails.application.routes.draw do
  resources :users
  get '/users/:id/delete', to: 'users#destroy', as: 'delete_user'
  get :user_id, controller: 'application'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :projects  
      get 'tasks/set_npos', action: :setnpos, controller: 'tasks'
      put 'tasks/change_npos', action: :change_npos, controller: 'tasks'
      resources :tasks
      resources :comments
      resources :users
      resources :command_items
      get 'tasks_set_npos', action: :setnpos, controller: 'tasks'
    end
  end
end

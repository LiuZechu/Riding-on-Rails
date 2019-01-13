Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
      #added tasks under users
    resources :tasks 

  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  match 'users/:user_id/tasks.:id' => 'tasks#complete', as: 'complete_task', via: :put
  get 'users/:user_id/completed' => 'tasks#view', as: 'view_completed'
  put 'users/:user_id/completed/:id' => 'tasks#undo', as: 'undo_task'
  get 'users/:user_id/search' => 'tasks#search', as: 'search_task'
  get '/admin' => 'welcome#admin', as: 'admin'
end

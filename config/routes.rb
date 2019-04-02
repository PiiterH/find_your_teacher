Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lessons, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :appointments, only: [:new, :create, :edit, :update, :destroy]
  delete '/lessons/:id', to: 'lessons#destroy', as: 'delete_lesson'
end

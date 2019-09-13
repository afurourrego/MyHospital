Rails.application.routes.draw do

  resources :arls
  resources :eps
  devise_for :users, controllers: { invitations: 'invitations' }

  resources :users
  resources :profiles
  resources :settings, only: %i[index]

  # get 'welcome/index'
  #
  # root to: 'welcome#index'
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

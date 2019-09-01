Rails.application.routes.draw do

  devise_for :users, controllers: { invitations: 'invitations' }

  resources :users

  # get 'welcome/index'
  #
  # root to: 'welcome#index'
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

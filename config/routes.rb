Rails.application.routes.draw do

  devise_for :users, controllers: { invitations: 'invitations' }

  resources :users
  resources :profiles
  resources :settings, only: %i[index]
  resources :eps, except: %i[index show]
  resources :arls, except: %i[index show]
  resources :appointments do
    get :check_assistance
    get :diagnostic
    patch :diagnostic_send
    resources :orders, except: %i[index]
  end
  resources :history, only: %i[index]

  # get 'welcome/index'
  #
  # root to: 'welcome#index'
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

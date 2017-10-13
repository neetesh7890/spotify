Rails.application.routes.draw do
 

  resources :dashboards, only: [:index]
  
  resources :users, only: [] do 
    resources :albums, only: [:index]
    get "albums/fetch", to: "albums#fetch"
  end


  post 'dashboards/search', to:'dashboards#search'

  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }


  devise_scope :user do 
    root 'users/sessions#new'
  end
end

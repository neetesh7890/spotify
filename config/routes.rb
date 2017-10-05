Rails.application.routes.draw do
 

  resources :dashboards, only: [:index]
  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get "/v1/me/playlists", to: "dashboards#index"


  devise_scope :user do 
    root 'users/sessions#new'
  end
end

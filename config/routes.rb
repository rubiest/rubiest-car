Rails.application.routes.draw do
  get "/dashboard" => 'dashboards#index'

  root 'pages#index'
  resource :company_profiles, except: [:index, :new, :destroy]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

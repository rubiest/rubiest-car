Rails.application.routes.draw do
  root 'pages#index'
  get "/dashboard" => 'dashboards#index'
  get "/garage/:id" => 'pages#garage', as: "garage_show"
  resource :company_profiles, except: [:index, :new, :destroy]
  resources :cars do
    resource :car_profiles, except: [:index, :new, :destroy]
  end

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

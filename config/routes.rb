Rails.application.routes.draw do
  root to: 'pages#home'
  get 'style-guide', to: 'pages#style_guide'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cities, only: [:index, :show] do
    resources :booking_providers, only: [:index]
  end

  resources :countries, only: [:index, :show] do
    resources :booking_providers, only: [:index]
  end

  resources :regions, only: [:index, :show]

end

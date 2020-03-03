Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :booking_providers do
  end
  resources :cities do
  end
  resources :city_features do
  end
  resources :city_themes do
  end
  resources :climates do
  end
  resources :countries do
  end
  resources :features do
  end
  resources :regions do
  end
  resources :themes do
  end

end

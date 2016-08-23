Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

  get 'restaurants' => 'restaurants#index'
  resources :restaurants
=======
  resources :restaurants do
  resources :reviews
end

>>>>>>> c38fd22d2e595f409b5b4e3f0c95db55657d489f
end

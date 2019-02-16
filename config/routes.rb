Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users

  resources :users do
    resources :stories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  resources :categories, only: :show, path: "" do

  end

=======
>>>>>>> Add footer, add links, add story model, add stories controller, add routes, modify application controller for login purposes.
end

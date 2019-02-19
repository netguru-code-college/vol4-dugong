Rails.application.routes.draw do

  root "categories#bad"
  devise_for :users

  resources :users

  post '/users/:id/follow_user', to: 'followers#follow_user', as: :follow_user
  post '/users/:id/unfollow_user', to: 'followers#unfollow_user', as: :unfollow_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: :show, path: "" do
    resources :stories
  end

end

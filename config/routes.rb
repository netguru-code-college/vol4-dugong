Rails.application.routes.draw do
  get 'followers/follow_user'
  get 'followers/unfollow_user'
  root "categories#bad"
  devise_for :users

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: :show, path: "" do
    resources :stories
  end

end

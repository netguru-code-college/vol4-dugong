Rails.application.routes.draw do
  root "categories#bad"
  devise_for :users

  resources :users

  resources :categories, only: :show, path: "" do
    resources :stories do
      resources :comments, only: :create
    end
  end



end

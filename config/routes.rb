Rails.application.routes.draw do
  resources :projects do
    resources :tags
  end
  namespace :project do
    resources :tags
  end
  resources :projects do
    resources :tasks do
    resources :tags 
    end
  end
  namespace :project do
    resources :tasks do
    resources :tags 
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end


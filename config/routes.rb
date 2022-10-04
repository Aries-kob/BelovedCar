Rails.application.routes.draw do
  root to: "menber/homes#top"
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  swssions: "admin/sessions"
  }
  
  devise_for :menbers,skip: [:passwords], controllers: {
    registrations: "menber/registrations",
    sessions: "menber/sessions"
  }
  
  namespace :menber do
    resources :rooms
  end
  namespace :menber do
    resources :posts
  end
  namespace :admin do
    root to: "homes#top"
  end
  namespace :menber do
    root to: "homes#top"
    get 'homes/about', as: 'about'
  end
  namespace :menber do
    resources :favorites, only: [:create, :destroy]
  end
  namespace :menber do
    resources :post_comments, only: [:create, :destroy]
  end
  namespace :menber do
    resources :cars 
  end
  namespace :admin do
    resources :cars, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
  end
  namespace :admin do
    resources :menbers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

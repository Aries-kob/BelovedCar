Rails.application.routes.draw do
  root to: "public/homes#top"
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :menbers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  namespace :public do
    resources :menbers
  end
  
  namespace :public do
    resources :boards, only: [:index, :new, :create]
  end  
  namespace :public do
    resources :rooms
  end
  namespace :public do
    resources :posts do
     resource :favorites, only: [:create, :destroy]
     resource :post_comments, only: [:new, :create, :destroy]
    end 
  end
  namespace :admin do
    root to: "homes#top"
  end
  namespace :public do
    root to: "homes#top"
    get 'homes/about', as: 'about'
  end

  namespace :public do
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

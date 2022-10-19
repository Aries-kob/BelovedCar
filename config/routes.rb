Rails.application.routes.draw do
  root to: "public/homes#top"
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :menbers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  devise_scope :menber do
    post 'menbers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end  
  
  namespace :public do
    resources :menbers do
      get :confirm
      patch :status
    end  
  end
  
  namespace :public do
    resources :boards, only: [:index, :new, :create, :show] do
      resources :board_comments, only: [:create, :destroy]
    end  
    
  end  
  namespace :public do
    resources :rooms
  end
  namespace :public do
    resources :posts do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:new, :create, :destroy]
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
  
  namespace :admin do
    resources :posts, only: [:index, :show, :destroy]
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

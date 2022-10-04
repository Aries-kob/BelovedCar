Rails.application.routes.draw do
  namespace :menbers do
    get 'rooms/new'
    get 'rooms/create'
    get 'rooms/index'
    get 'rooms/show'
    get 'rooms/edit'
    get 'rooms/update'
    get 'rooms/destroy'
  end
  namespace :menbers do
    get 'posts/new'
    get 'posts/create'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :menbers do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :menbers do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :menbers do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
  namespace :menbers do
    get 'car/new'
    get 'car/index'
    get 'car/show'
    get 'car/edit'
    get 'car/update'
    get 'car/destroy'
  end
  namespace :admin do
    get 'cars/index'
    get 'cars/show'
    get 'cars/edit'
    get 'cars/update'
  end
  namespace :admin do
    get 'genres/create'
    get 'genres/indexw'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'menbers/index'
    get 'menbers/show'
    get 'menbers/edit'
    get 'menbers/update'
  end
  devise_for :menbers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

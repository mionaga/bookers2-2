Rails.application.routes.draw do
 
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => "homes#about",as:'about'
  
  get 'tagsearches/search', to: 'tagsearches#search'
  
  resources :books, only: [:create, :show, :edit, :update, :index, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers" 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

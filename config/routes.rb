Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
    resources :votes, only:[ :create, :destroy]
  end
end

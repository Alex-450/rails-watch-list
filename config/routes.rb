Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: :destroy
  get :movies, to: 'movies#search'
  root to: 'lists#index'
end

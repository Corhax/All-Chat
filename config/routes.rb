Rails.application.routes.draw do

  devise_for :users

  root 'posts#index'

  resources :posts do
    resources :comments
  end

  get 'search'=> 'posts#search', as: 'search'
  get 'search_results' => 'posts#search_results', as: 'search_results'

  resources :users

end

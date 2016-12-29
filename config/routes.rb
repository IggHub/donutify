Rails.application.routes.draw do
  resources :users
  resources :posts
  #post 'posts/scrape' => 'posts#scrape'
  post 'scrape' => 'posts#scrape', as: :scrape
  get 'welcome/index'

  root 'posts#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

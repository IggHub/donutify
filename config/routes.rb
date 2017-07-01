Rails.application.routes.draw do
  get 'scrape' => 'posts#scrape', as: :scrape
  root 'posts#index'

  get 'pages/about'
  get 'pages/why'
  #resources :users
  resources :posts
  #post 'posts/scrape' => 'posts#scrape'
end

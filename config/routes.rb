Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/why'

  #resources :users
  resources :posts
  #post 'posts/scrape' => 'posts#scrape'
  post 'scrape' => 'posts#scrape', as: :scrape
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

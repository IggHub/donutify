source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'yelp', require: 'yelp'
gem "figaro"
gem 'bootstrap-sass', '~> 3.3.6'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
gem 'geocoder'
gem 'gmaps4rails'
gem 'capybara'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
  gem 'rspec-rails', '~>3.4'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'faker', '~> 1.6.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
   gem 'pg', '~>0.18'
   gem 'rails_12factor'
 end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

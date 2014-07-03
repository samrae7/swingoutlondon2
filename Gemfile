source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.1.2'
gem 'rails', '4.1.2'

# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

  # bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'figaro'
gem 'foundation-rails'
gem 'haml-rails'
gem 'pg'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec', '~> 4.2', :require=>false
  gem 'spring', '~> 1.1'
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :test do
  gem 'shoulda-matchers', '~> 2.6', require: false
  gem 'fabrication'
  gem 'capybara'
  gem 'database_cleaner', '1.3'
  gem 'email_spec'
  gem 'simplecov', '~> 0.7.1' # Their github says to downgrade, since 0.8 has issues
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'thin'
  gem 'pry', '~> 0.9'
end

group :production do
  gem 'unicorn'
end




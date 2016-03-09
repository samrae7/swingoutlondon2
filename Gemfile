source 'https://rubygems.org'

ruby '2.3.0'
gem 'rails', '~> 4.2.5'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 1.2'

  # bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'devise', '~> 3.5'
gem 'foundation-rails', '~> 5.0'
gem 'foundation_rails_helper'
gem 'foundation-icons-sass-rails'
gem 'date_validator', '~> 0.8'
gem 'haml-rails', '~> 0.5'

# Gems to include javascript libraries:
gem 'cocoon', '~> 1.2.6'
gem 'pickadate-rails', '~> 3.5'
gem 'select2-rails', '< 4'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :test do
  gem 'shoulda-matchers', '~> 3.0.1', require: false
  gem 'fabrication', '~> 2.11'
  gem 'capybara', '~> 2.4'
  gem 'poltergeist', '~> 1.6'
  gem 'database_cleaner', '~> 1.3'
  # gem 'email_spec', '~> 1.5' not used yet
  gem 'simplecov', '~> 0.9' # Their github says to downgrade, since 0.8 has issues
  gem 'timecop', '~> 0.7'
  gem 'faker', '~> 1.4'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'fuubar'
  gem 'thin'
  gem 'pry-rails'
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor' # To enable heroku logging and static assets
end




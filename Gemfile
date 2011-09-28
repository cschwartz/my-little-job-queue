source 'http://rubygems.org'

gem 'rails', '3.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Asset template engines
gem 'sass-rails'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

gem 'devise'
gem 'activeadmin'
gem 'meta_search'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :test, :development do
  gem "rspec-rails"
  gem "capybara"
  gem "launchy"
  gem "factory_girl_rails"
  gem "webrat"
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'rb-fsevent'
    gem 'growl'
  end
end
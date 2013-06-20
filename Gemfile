source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'strong_parameters', '0.2.1'
gem 'configurate', '0.0.8'
gem 'json', '1.8.0'

# App Server
gem 'puma', '2.0.1'

# Database
gem 'mysql2', '0.3.11', :group => :mysql
gem 'pg', '0.15.1', :group => :postgres

# Auth
gem 'devise', '2.2.4'

#i18n
gem 'rails-i18n', '0.7.3'

# View
gem 'turbolinks', '1.2.0'
gem 'twitter-bootstrap-rails', '2.2.7'
gem 'csv_shaper', '1.0.0'
gem 'momentjs-rails', '2.0.0.2'
gem 'jquery-rails', '3.0.1'
gem "bootstrap-flashmessage", "0.0.2"
gem "bootstrap-datetimepicker-rails", "0.0.11"
gem 'bootstrap-daterangepicker-rails', '0.0.5'

#Performance
gem 'will_paginate', '~> 3.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails', '>= 2.3.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# Testing
gem 'rspec-rails', '>= 2.13.1', :group => [:test, :development]

group :development do
  #Optimizing
  gem 'rack-mini-profiler', '>= 0.1.26'
  # Debugging
  gem 'better_errors', '>= 0.9.0'
  gem 'binding_of_caller', '>= 0.7.1'
  gem 'debugger', '>= 1.6.0'
end

group :test do
  gem 'factory_girl_rails', '>= 4.2.1'
  gem 'capybara', '>= 2.1.0'
  gem 'guard-rspec', '>= 3.0.0'
end

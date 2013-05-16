source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'strong_parameters'
gem 'configurate'

# App Server
gem 'puma', '1.6.3'

# Database
gem 'mysql2'
gem 'pg'

# Auth
gem 'devise', '2.2.4'

#i18n
gem 'rails-i18n', '0.6.4'

# View
gem 'twitter-bootstrap-rails', '2.2.6'
gem 'csv_shaper', '1.0.0'
gem 'momentjs-rails', '2.0.0.1'
gem 'jquery-rails', '2.2.1'
gem "bootstrap-datetimepicker-rails", "0.0.11"
gem 'bootstrap-daterangepicker-rails', '0.0.5'

#Performance
gem 'will_paginate', '~> 3.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

# Testing
gem 'rspec-rails', '2.13.0', group: [:test, :development]

group :development do
  #Optimizing
  gem 'rack-mini-profiler'
  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debugger'
end

group :test do
  gem 'factory_girl_rails', '4.2.1'
  gem 'capybara', '2.0.3'
  gem 'guard-rspec', '2.5.2'
end
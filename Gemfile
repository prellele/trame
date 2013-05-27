source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'strong_parameters', '0.2.1'
gem 'configurate'
gem 'json', '1.8.0'

# App Server
gem 'puma', '2.0.1'

# Database
ENV['DB'] ||= 'mysql'
gem 'mysql2', '0.3.11' if ENV['DB'].nil? || ENV['DB'] == 'mysql'
gem 'pg', '0.14.1' if ENV['DB'] == 'postgres'

# Auth
gem 'devise', '2.2.4'

#i18n
gem 'rails-i18n', '0.7.3'

# View
gem 'twitter-bootstrap-rails', '2.2.6'
gem 'csv_shaper', '1.0.0'
gem 'momentjs-rails', '2.0.0.1'
gem 'jquery-rails', '2.2.1'
gem "bootstrap-flashmessage", "0.0.1"
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
gem 'rspec-rails', '2.13.1', group: [:test, :development]

group :development do
  #Optimizing
  gem 'rack-mini-profiler'
  # Debugging
  gem 'better_errors', '0.8.0'
  gem 'binding_of_caller'
  gem 'debugger'
end

group :test do
  gem 'factory_girl_rails', '4.2.1'
  gem 'capybara', '2.1.0'
  gem 'guard-rspec', '3.0.0'
end

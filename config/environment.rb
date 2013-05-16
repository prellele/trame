# Load the rails application
require File.expand_path('../application', __FILE__)

# Load configuration system early 
require Rails.root.join('config', 'config_loader')

# Initialize the rails application
Trame::Application.initialize!

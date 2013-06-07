#!/bin/sh

# Create a application.yml
echo "Creating application.yml"
cp config/application.yml.example config/application.yml

# Create a database.yml for the right database
echo "Setting up database.yml for $DB"
cp config/database.yml.example config/database.yml


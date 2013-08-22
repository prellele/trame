trame
=============

[![Build Status](https://travis-ci.org/prellele/trame.png?branch=master)](https://travis-ci.org/prellele/trame)
[![Dependency Status](https://gemnasium.com/prellele/trame.png)](https://gemnasium.com/prellele/trame)
[![Code Climate](https://codeclimate.com/github/prellele/trame.png)](https://codeclimate.com/github/prellele/trame)

Timetracking via Web

Demo (Heroku): http://demo.trame.prellele.de

Development sponsored by [Basix IT](http://www.basix.de)

## Getting Started
clone the repo

    $ git clone https://github.com/prellele/trame.git
    $ cd trame
    
bundle install

    bundle install

run the web server (puma)

	puma

the site should be at http://localhost:9292

don't forget to set the right timezone in config/application.rb. e.g:

    config.time_zone = 'Berlin'

you can find the list of supported timezones here: http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html


## Ruby on Rails

This application requires:

* Ruby version 1.9.2
* Rails version 3.2.7

## Database

This application uses MySQL or PostgreSQL with ActiveRecord.

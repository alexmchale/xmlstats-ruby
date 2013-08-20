xmlstats-ruby
=============

A ruby client for xmlstats, an easy to use API for obtaining MLB and NBA statistics in XML or JSON.

See xmlstats here: https://erikberg.com/api

Installation
------------

Add this line to your application's Gemfile:

    gem 'xmlstats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xmlstats

Usage
-----

### Events ###

To query the MLB events for a given date:

    Xmlstats::Endpoints::Event.fetch(Date.parse("2012-08-01"), :mlb)

To query all events for a given date:

    Xmlstats::Endpoints::Event.fetch(Date.parse("2013-08-01"))

### MLB Standings ###

To query the MLB standings for a given date:

    Xmlstats::Endpoints::MlbStanding.fetch(Date.parse("2012-09-01"))

For the current date, you can drop the parameter:

    Xmlstats::Endpoints::MlbStanding.fetch

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

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

Configuration
-------------

Configure xmlstats-ruby as follows with your API key and contact info. The
contact info is used in the User-Agent string.

You can choose to set this via environment variables:

    export XMLSTATS_API_KEY="my api key"
    export XMLSTATS_CONTACT_INFO="alex@anticlever.com"

Or in Ruby:

    Xmlstats.api_key = "my api key"
    Xmlstats.contact_info = "alex@anticlever.com"

This library supports a couple of different caching mechanisms to prevent
constantly hitting the API server.

    Xmlstats.cacher = Xmlstats::Cachers::Memory.new
    Xmlstats.cacher = Xmlstats::Cachers::Redis.new(:host => "10.0.81.7")

The cacher can be any object which responds to the get(key) and set(key, value)
methods. The Redis cacher will automatically expire keys after 1 hour. The
memory cacher never expires keys.

Usage
-----

### General ###

* The objects returned by each endpoint method match the specification ( https://erikberg.com/api ).
* You can inspect what fields are available on a result with the "fields" method.

### Events ###

https://erikberg.com/api#events

To query the MLB events for a given date:

    Xmlstats.events(Date.parse("2013-08-01"), :mlb)

To query all events for a given date:

    Xmlstats.events(Date.parse("2013-08-01"))

### MLB Standings ###

https://erikberg.com/api#standings

To query the MLB standings for a given date:

    Xmlstats.mlb_standing(Date.parse("2012-09-01"))

For the current date, you can drop the parameter:

    Xmlstats.mlb_standing

### NBA Standings ###

https://erikberg.com/api#standings

To query the NBA standings for a given date:

    Xmlstats.nba_standing(Date.parse("2013-02-01"))

### MLB Wild Card Standings ###

https://erikberg.com/api#wildcard

To query the MLB Wild Card Standings for a given date:

    Xmlstats.mlb_wild_card_standing(Date.parse("2013-08-09"))

To query the MLB Wild Card Standings for the current date:

    Xmlstats.mlb_wild_card_standing

### MLB Box Score ###

https://erikberg.com/api#boxscore

When querying the box score, you must specify the event-id. You can find this
event-id as returned by the events or team results methods.

    Xmlstats.mlb_box_score("20130818-kansas-city-royals-at-detroit-tigers")

### NBA Box Score ###

https://erikberg.com/api#nbaboxscore

When querying the box score, you must specify the event-id. You can find this
event-id as returned by the events or team results methods.

    Xmlstats.nba_box_score("20131215-portland-trail-blazers-at-detroit-pistons")

### MLB Teams ###

https://erikberg.com/api#teams

To query the current list of MLB teams:

    Xmlstats.mlb_teams

### NBA Teams ###

https://erikberg.com/api#teams

To query the current list of NBA teams:

    Xmlstats.nba_teams

### MLB Team Results ###

https://erikberg.com/api#teamresults

To query a team's full schedule for the given season:

    Xmlstats.mlb_team_results("detroit-tigers", 2012)

### NBA Team Results ###

https://erikberg.com/api#teamresults

To query a team's full schedule for the given season:

    Xmlstats.nba_team_results("detroit-pistons", 2012)

### NBA Leaders ###

https://erikberg.com/api#nbaleaders

To query the current leaders for points per game:

    Xmlstats.nba_leaders(:points_per_game)

Examples
--------

See https://github.com/alexmchale/xmlstats-ruby/tree/master/examples

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

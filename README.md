xmlstats-ruby
=============

A ruby client for [xmlstats](https://erikberg.com/api), an easy to use API for obtaining MLB and NBA statistics in XML or JSON.

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

    export XMLSTATS_API_KEY="xxxxx-xxxx-xxxx"
    export XMLSTATS_CONTACT_INFO="you@example.com"

Or in Ruby:

    Xmlstats.api_key = "xxxxx-xxxx-xxxx"
    Xmlstats.contact_info = "you@example.com"

The User-Agent string sent to the server will use your specified contact info
and look like "xmlstats-ruby/1.3.0 (you@example.com)".

Caching
-------

This library supports a couple of different caching mechanisms to prevent
constantly hitting the API server.

    Xmlstats.cacher = Xmlstats::Cachers::Memory.new
    Xmlstats.cacher = Xmlstats::Cachers::Redis.new(:host => "10.0.81.7")

The cacher can be any object which responds to the get(key) and set(key, value)
methods. The Redis cacher will automatically expire keys after 1 hour. The
memory cacher never expires keys.

The Redis cacher can accept a hash for options which will be passed to
Redis.new, or a previously instantiated Redis object. Note that this gem does
not depend on the redis gem, so you will need to add that as your own
dependency if you choose to use that cacher.

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

### MLB Roster ###

https://erikberg.com/api/methods/roster and https://erikberg.com/api/issues/197

To query the current roster for an MLB team:

    For 25-men roster: Xmlstats.mlb_roster("texas-rangers") 

    For 40-men roster: Xmlstats.mlb_roster("texas-rangers", true) - Please note: https://erikberg.com/api/issues/197 

    ***Please note:*** At the moment xmlstats always returns 40-men roster, to prevent errors please use Xmlstats.mlb_roster("texas-rangers") for now. Depending on the API owner both functions might work in the future, but it is added for now already since it is suggested at https://erikberg.com/api/methods/roster.

This method returns an array of **Player** objects with the following fields:

    [:last_name, :first_name, :display_name, :birthdate, :age, :position,
    :height_in, :height_cm, :weight_lb, :weight_kg, :height_formatted]


### NBA Roster ###

https://erikberg.com/api/issues/135

To query the current roster for an NBA team:

    Xmlstats.nba_roster("detroit-pistons")

This method returns an array of **Player** objects with the following fields:

    [:last_name, :first_name, :display_name, :birthdate, :age, :position,
    :height_in, :height_cm, :weight_lb, :weight_kg, :height_formatted]



Examples
--------

See https://github.com/alexmchale/xmlstats-ruby/tree/master/examples

Troubleshooting
---------------

### Certificate Error on OSX ###

On OSX you may see the following exception when trying to use xmlstats:

    /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:918:in `connect': SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (OpenSSL::SSL::SSLError)
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:918:in `block in connect'
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/timeout.rb:52:in `timeout'
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:918:in `connect'
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:862:in `do_start'
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:851:in `start'
            from /Users/alexmchale/.rbenv-osx/versions/2.0.0-p247/lib/ruby/2.0.0/net/http.rb:1367:in `request'
            from /Users/alexmchale/src/anticlever/xmlstats/lib/xmlstats/http_getters/net_http.rb:21:in `get'
            from /Users/alexmchale/src/anticlever/xmlstats/lib/xmlstats/endpoint.rb:41:in `http_get'
            from /Users/alexmchale/src/anticlever/xmlstats/lib/xmlstats/endpoint.rb:52:in `fetch_json'
            from /Users/alexmchale/src/anticlever/xmlstats/lib/xmlstats/endpoints/events.rb:8:in `fetch'
            from /Users/alexmchale/src/anticlever/xmlstats/lib/xmlstats.rb:91:in `events'
            from test.rb:19:in `<main>'

To get around this, install the curl-ca-bundle in [Homebrew](http://brew.sh):

    [zeus ~/src/anticlever/xmlstats]$ brew install curl-ca-bundle
    ==> Downloading https://downloads.sourceforge.net/project/machomebrew/mirror/curl-ca-bundle-1.87.tar.bz2
    ######################################################################## 100.0%
    ==> Caveats
    To use these certificates with OpenSSL:

      export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
    ==> Summary
    🍺  /usr/local/Cellar/curl-ca-bundle/1.87: 2 files, 256K, built in 2 seconds

Finally, add the following to your environment before your application starts:

    export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

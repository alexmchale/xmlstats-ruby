require "time"
require "net/http"
require "net/https"
require "json"

require "xmlstats/endpoint"
require "xmlstats/version"

require "xmlstats/object"

require "xmlstats/objects/standing"
require "xmlstats/objects/team"
require "xmlstats/objects/site"
require "xmlstats/objects/event"
require "xmlstats/objects/basketball_stat"
require "xmlstats/objects/batter"
require "xmlstats/objects/event_information"
require "xmlstats/objects/official"
require "xmlstats/objects/pitcher"
require "xmlstats/objects/mlb_box_score"
require "xmlstats/objects/nba_box_score"
require "xmlstats/objects/team_result"
require "xmlstats/objects/nba_leader"

require "xmlstats/cachers/memory"
require "xmlstats/cachers/redis"

require "xmlstats/http_getters/net_http"

require "xmlstats/endpoints/event"
require "xmlstats/endpoints/mlb_standing"
require "xmlstats/endpoints/nba_standing"
require "xmlstats/endpoints/mlb_wild_card_standing"
require "xmlstats/endpoints/mlb_box_score"
require "xmlstats/endpoints/nba_box_score"
require "xmlstats/endpoints/mlb_teams"
require "xmlstats/endpoints/nba_teams"
require "xmlstats/endpoints/mlb_team_results"
require "xmlstats/endpoints/nba_team_results"
require "xmlstats/endpoints/nba_leaders"

module Xmlstats

  def self.api_key
    @api_key
  end

  def self.api_key= api_key
    @api_key = api_key
  end

  def self.contact_info
    error = "specify user-agent contact info with: Xmlstats.contact_info = 'you@example.com'"
    @contact_info or raise(error)
  end

  def self.contact_info= contact_info
    @contact_info = contact_info
  end

  def self.http_getter
    @http_getter || Xmlstats::HttpGetters::NetHttp.new
  end

  def self.http_getter= http_getter
    @http_getter = http_getter
  end

  def self.cacher
    @cacher || Xmlstats::Cachers::Memory.new
  end

  def self.cacher= cacher
    @cacher = cacher
  end

end

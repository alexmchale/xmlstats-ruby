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
require "xmlstats/objects/player"

require "xmlstats/cachers/memory"
require "xmlstats/cachers/redis"

require "xmlstats/http_getters/net_http"

require "xmlstats/endpoints/events"
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
require "xmlstats/endpoints/nba_roster"
require "xmlstats/endpoints/mlb_roster"

module Xmlstats

  class << self

    # Manage api key

    def api_key
      @api_key ||= ENV["XMLSTATS_API_KEY"]
    end

    def api_key= api_key
      @api_key = api_key
    end

    # Manage contact info

    def contact_info
      error = "specify user-agent contact info with: Xmlstats.contact_info = 'you@example.com'"
      @contact_info ||= ENV["XMLSTATS_CONTACT_INFO"]
      @contact_info or raise(error)
    end

    def contact_info= contact_info
      @contact_info = contact_info
    end

    # Manage http getter

    def http_getter
      @http_getter || Xmlstats::HttpGetters::NetHttp.new
    end

    def http_getter= http_getter
      @http_getter = http_getter
    end

    # Manage cacher

    def cacher
      @cacher || Xmlstats::Cachers::Memory.new
    end

    def cacher= cacher
      case cacher.class.name
      when "Redis" then @cacher = Xmlstats::Cachers::Redis.new(cacher)
      else              @cacher = cacher
      end
    end

    # Wrapper methods to each endpoint

    def events *args
      Xmlstats::Endpoints::Events.fetch *args
    end

    def mlb_box_score *args
      Xmlstats::Endpoints::MlbBoxScore.fetch *args
    end

    def nba_box_score *args
      Xmlstats::Endpoints::NbaBoxScore.fetch *args
    end

    def mlb_standing *args
      Xmlstats::Endpoints::MlbStanding.fetch *args
    end

    def nba_standing *args
      Xmlstats::Endpoints::NbaStanding.fetch *args
    end

    def mlb_wild_card_standing *args
      Xmlstats::Endpoints::MlbWildCardStanding.fetch *args
    end

    def mlb_team_results *args
      Xmlstats::Endpoints::MlbTeamResults.fetch *args
    end

    def nba_team_results *args
      Xmlstats::Endpoints::NbaTeamResults.fetch *args
    end

    def mlb_teams *args
      Xmlstats::Endpoints::MlbTeams.fetch *args
    end

    def nba_teams *args
      Xmlstats::Endpoints::NbaTeams.fetch *args
    end

    def nba_leaders *args
      Xmlstats::Endpoints::NbaLeaders.fetch *args
    end

    def nba_roster *args
      Xmlstats::Endpoints::NbaRoster.fetch *args
    end

    def mlb_roster *args
      Xmlstats::Endpoints::MlbRoster.fetch *args
    end

  end

end

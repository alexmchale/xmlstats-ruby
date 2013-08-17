require "time"
require "net/http"
require "net/https"
require "json"

require "xmlstats/endpoint"
require "xmlstats/version"

require "xmlstats/endpoints/mlb_standing"

module Xmlstats

  def self.api_key
    @api_key
  end

  def self.api_key= api_key
    @api_key
  end

end

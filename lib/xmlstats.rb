require "time"
require "net/http"
require "net/https"

require "xmlstats/version"
require "xmlstats/mlb_standing"

module Xmlstats

  def self.api_key
    @api_key
  end

  def self.api_key= api_key
    @api_key
  end

end

class Xmlstats::Endpoints::NbaRoster

  include Xmlstats::Endpoint

  def self.fetch(team_id = nil)
    raise "please specify team_id as detailed in https://erikberg.com/api/issues/135" unless team_id
    response = fetch_json("nba/roster/#{team_id}")
    response["players"].map do |player_hash|
      Xmlstats::Objects::Player.new player_hash
    end
  end

end

class Xmlstats::Endpoints::NbaRoster

  include Xmlstats::Endpoint

  def self.fetch(team_id = nil)
    raise "please specify team_id as detailed in https://erikberg.com/api/issues/135" unless team_id
    response = fetch_json("nba/roster/#{team_id}")
    [ response ].flatten.map do |result|
      Xmlstats::Objects::Player.new result["player"]
    end
  end

end

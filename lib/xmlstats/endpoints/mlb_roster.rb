class Xmlstats::Endpoints::MlbRoster

  include Xmlstats::Endpoint

  def self.fetch(team_id = nil, expanded = false)
    raise "please specify team_id as detailed in https://erikberg.com/api/issues/135" unless team_id

    params = {}
    if expanded
    	params = {status: "expanded"} #40-men roster please see https://erikberg.com/api/methods/roster 
    end

    response = fetch_json("mlb/roster/#{team_id}", params)

    response["players"].map do |player_hash|
      Xmlstats::Objects::Player.new player_hash
    end
  end

end

class Xmlstats::Endpoints::MlbRoster

  include Xmlstats::Endpoint

  # January 10, 2015 - expanded doesn't work yet other than suggested at https://erikberg.com/api/methods/roster but added feature anyway also see created issue at https://erikberg.com/api/issues/197
  def self.fetch(team_id = nil, expanded = false)
    raise "please specify team_id as detailed in https://erikberg.com/api/issues/135" unless team_id

    if expanded
    	fetch_expanded = "?status=expanded" #40-men roster please see https://erikberg.com/api/methods/roster and https://erikberg.com/api/issues/197
    else
    	fetch_expanded = "" #25-men roster
    end

    response = fetch_json("mlb/roster/#{team_id}#{fetch_expanded}")
    response["players"].map do |player_hash|
      Xmlstats::Objects::Player.new player_hash
    end
  end

end
